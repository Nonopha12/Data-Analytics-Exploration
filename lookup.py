# Import libraries to work with
import sqlite3
import json
import xml.etree.ElementTree as ET
from xml.dom import minidom

# Connect to sqlite3 and the database
try:
    conn = sqlite3.connect("HyperionDev.db")
except sqlite3.Error:
    print("Please store your database as HyperionDev.db")
    quit()

cur = conn.cursor()


def usage_is_incorrect(input, num_args):
    """
    Checks if the number of arguments provided by the user matches the expected number.

    Args:
        input (list): The user input, with the command and arguments.
        num_args (int): The expected number of arguments for the command.

    Returns:
        bool: True if the number of arguments is incorrect, False otherwise.
    """
    if len(input) != num_args + 1:
        print(f"The {input[0]} command requires {num_args} arguments.")
        return True
    return False


def store_data_as_json(data, filename):
    """
    Saves the given data in JSON format to the specified file.

    Args:
        data (dict): The data to be stored.
        filename (str): The name of the output file, which should end with a .json extension.
    """
    output_data = json.dumps(data, indent=4)

    with open(filename, "w") as f:
        f.write(output_data)


def store_data_as_xml(data, filename):
    """
    Saves the given data in XML format using ElementTree and writes it to the specified file.

    Args:
        data (dict or list): The data to be stored, where keys represent entities and values represent attributes.
                            If the data is a list, it will be rectified to a dictionary with numeric keys.
        filename (str): The name of the output file, which should end with a .xml extension.
    """
    
    root = ET.Element("output-report")

    if isinstance(data, list):
        data = {i: v for i, v in enumerate(data)}

    for root_key, root_value in data.items():
        entity = ET.SubElement(root, "entity", attrib={"entity-key": str(root_key)})

        for key, value in root_value.items():
            sub_element = ET.SubElement(entity, str(key))
            sub_element.text = str(value)

        tree = ET.ElementTree(root)

        xml_str = ET.tostring(root, encoding='utf-8')

        dom = minidom.parseString(xml_str)
        pretty_xml_str = dom.toprettyxml(indent="    ")

        with open(filename, "w", encoding="utf-8") as f:
            f.write(pretty_xml_str)


def offer_to_store(data):
    """
    Asks the user if they want to store the given data in either XML or JSON format.

    Args:
        data (dict): The data to be stored.
    """
    while True:
        print("Would you like to store this result?")
        choice = input("Y/[N]? : ").strip().lower()

        if choice == "y":
            filename = input("Specify filename. Must end in .xml or .json: ")
            ext = filename.split(".")[-1]
            if ext == 'xml':
                store_data_as_xml(data, filename)
                break
            elif ext == 'json':
                store_data_as_json(data, filename)
                break
            else:
                print("Invalid file extension. Please use .xml or .json")

        elif choice == 'n':
            break

        else:
            print("Invalid choice")


usage = '''
What would you like to do?

d - demo
vs <student_id>            - view subjects taken by a student
la <firstname> <surname>   - lookup address for a given firstname and surname
lr <student_id>            - list reviews for a given student_id
lc <teacher_id>            - list all courses taken by teacher_id
lnc                        - list all students who haven't completed their course
lf                         - list all students who have completed their course and achieved 30 or below
e                          - exit this program

Type your option here: '''

print("Welcome to the data querying app!")

# The main menu
while True:
    print()
    user_input = input(usage).split(" ")
    print()

    command = user_input[0]
    if len(user_input) > 1:
        args = user_input[1:]

    if command == 'd':
        data = cur.execute("SELECT * FROM Student")
        for _, firstname, surname, _, _ in data:
            print(f"{firstname} {surname}")

    elif command == 'vs':
        if usage_is_incorrect(user_input, 1):
            continue
        student_id = args[0]
        data = cur.execute(f"""
                           SELECT Course.course_name, Course.course_code
                            FROM Course
                            INNER JOIN StudentCourse
                            ON Course.course_code = StudentCourse.course_code
                            WHERE StudentCourse.student_id = '{student_id}'""").fetchall()

        output_dict = {f"{student_id}": {}}
        print(f"Displaying Student Courses with ID: {student_id}")

        for row in data:
            course_name = row[0]
            course_code = row[1]
            output_dict[f"{student_id}"][f"{course_code}"] = course_name
            print(f"Course name: {course_name}")
            print(f"Course code: {course_code}")
            print()

        offer_to_store(output_dict)

    elif command == 'la':
        if usage_is_incorrect(user_input, 2):
            continue
        firstname, surname = args[0], args[1]

        data = cur.execute(
            f"SELECT first_name, last_name, address_id FROM Student WHERE first_name='{firstname}' AND last_name='{surname}'")
        row = [value for value in data][0]
        address_id = row[2]

        data = cur.execute(f"SELECT street, city FROM Address WHERE address_id={address_id}")
        rows = [value for value in data]

        key = f"{firstname}-{surname}"
        output_dict = {key: {}}

        for row in rows:
            output_dict[key]["street"] = row[0]
            output_dict[key]["city"] = row[1]

        offer_to_store(output_dict)

    elif command == 'lr':
        if usage_is_incorrect(user_input, 1):
            continue
        student_id = args[0]
        data = cur.execute(
            f"SELECT review_text, completeness, efficiency, style, documentation, student_id FROM Review WHERE student_id='{student_id}'")
        rows = [value for value in data]

        output_dict = {f"{student_id}": {}}
        for row in rows:
            output_dict[f"{student_id}"] = {
                "review_text": row[0],
                "completeness": row[1],
                "efficiency": row[2],
                "style": row[3],
                "documentation": row[4]
            }
            print(f"Student_ID:{student_id} - {row[0]}")

        offer_to_store(output_dict)

    elif command == 'lc':
        if usage_is_incorrect(user_input, 1):
            continue
        teacher_id = args[0]
        data = cur.execute(f"SELECT course_name, teacher_id FROM Course WHERE teacher_id='{teacher_id}'")
        rows = [value for value in data]
        output_dict = {f"{teacher_id}": {}}

        for row in rows:
            output_dict[f"{teacher_id}"]["course_name"] = row[0]

        offer_to_store(output_dict)

    elif command == 'lnc':
        data = cur.execute("""
            SELECT Student.student_id, Student.first_name, Student.last_name, Student.email, Course.course_name
            FROM Student 
            JOIN StudentCourse 
            ON Student.student_id = StudentCourse.student_id
            JOIN Course
            ON Course.course_code = StudentCourse.course_code
            WHERE StudentCourse.is_complete = 0""").fetchall()

        data = [
            {'student_id': row[0], 'first_name': row[1], 'last_name': row[2], 'email': row[3], 'course_name': row[4]}
            for row in data]
        for row in data:
            print(row)
        offer_to_store(data)

    elif command == 'lf':
        data = cur.execute("""
            SELECT Student.student_id, Student.first_name, Student.last_name, Student.email, Course.course_name, StudentCourse.mark
            FROM Student 
            JOIN StudentCourse 
            ON Student.student_id = StudentCourse.student_id
            JOIN Course
            ON Course.course_code = StudentCourse.course_code
            WHERE StudentCourse.is_complete = 1 AND StudentCourse.mark <= 30""").fetchall()
        data = [
            {'student_id': row[0], 'first_name': row[1], 'last_name': row[2], 'email': row[3], 'course_name': row[4],
             'mark': row[5]} for row in data]
        for row in data:
            print(row)
        offer_to_store(data)

    elif command == 'e':
        print("Programme exited successfully!")
        break

    else:
        print(f"Incorrect command: '{command}'")