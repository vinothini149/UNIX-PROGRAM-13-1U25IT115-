# Add User and Display User Details

## Aim

To create a user in Linux and display the details of the user using the `id` command.

## Objective

The objective of this assignment is to understand how to:

* Create a user in Linux using the `useradd` command.
* Display user details using the `id` command.
* Execute Linux commands through a Bash script.
* Verify the result using automated testing.

## Algorithm

**Step 1:** Open the Terminal on your Linux machine.

**Step 2:** Create a user using the `useradd` command.

**Step 3:** Display the details of the user using the `id` command.

**Step 4:** Verify that the user has been created successfully.

**Step 5:** Save the Bash script and push the changes to GitHub.

**Step 6:** GitHub Actions will automatically run the test cases.

## Commands

Use the following Linux commands:

```bash
useradd <username>
```

To display the details of the user:

```bash
id <username>
```

## Student Task

Complete the Bash program provided in:

```text
starter/solution.sh
```

The program should:

1. Create the required Linux user using `useradd`.
2. Display the details of the user using `id`.
3. Execute successfully.
4. Produce valid user information as output.

## Expected Output

The output should contain information similar to:

```text
uid=1001(username) gid=1001(username) groups=1001(username)
```

The UID and GID values may be different depending on the Linux system.

## Requirements

* Use the `useradd` command to create the user.
* Use the `id` command to display the user details.
* The user must actually be created in the Linux environment.
* Do not hard-code the expected output.
* Do not modify the test files.
* Do not modify the GitHub Actions workflow.
* The program should not require interactive input.

## Files in the Repository

```text
├── README.md
├── starter/
│   └── solution.sh
├── tests/
│   └── test_solution.sh
├── autograding.json
└── .github/
    └── workflows/
        └── autograding.yml
```

## Running the Program Locally

Make the script executable:

```bash
chmod +x starter/solution.sh
```

Run the program:

```bash
sudo bash starter/solution.sh
```

You can verify the user details using:

```bash
id <username>
```

## Submission

After completing the assignment, commit and push your changes:

```bash
git add starter/solution.sh
git commit -m "Complete user creation assignment"
git push
```

GitHub Actions will automatically run the test cases after the changes are pushed.

## Autograding

The assignment is automatically evaluated using GitHub Actions.

The following aspects are tested:

| Test                                 |   Marks |
| ------------------------------------ | ------: |
| Bash syntax is valid                 |      10 |
| `useradd` command is used            |      20 |
| Required user is created             |      30 |
| `id` command is used                 |      20 |
| User details are displayed correctly |      10 |
| Program executes successfully        |      10 |
| **Total**                            | **100** |

## Result

After successful completion, a Linux user should be created and the `id` command should display the user's UID, GID, and group information.
