# Demo Application with laravel Framework

Simple user management system consisting from users section and administrator section.



1. Users section: users can sign-up, login and logout

2. Administrator section: administrator can manage users (edit, delete, change status). Also administrator can add new type of users



	1.1. There are 3 pages for the user:
		Sign-up page
			Displays form with the following fields:
			
			1. First name

			2. Last name

			3. Username

			4. Password

			5. Confirm password
			Rules:
			1. All fields are mandatory

			2. Username should be unique, needs to be checked against database
			3. Password and confirm password should be equal
			If validation fails, corresponding error messages should be shown (wording doesn't matter)
			If validation is successful, user record should be saved to the database, 
			user is redirected to the login page
		Login page
			Displays form with the following fields:
			1. Username
			2. Password
			Rules:
			1. All fields are mandatory
			2. Username and password combination should have a match in the database
			3. Check if user is active/disabled (disabled user cannot log in)
			If validation fails, corresponding error messages should be shown 
			(wording doesn't matter)
			If validation is successful, user should be logged in and redirected to home page
		Home page
			1. Displays message stating "Welcome, $firstName"
			2. Contains logout link, clicking the link will logout the user and redirect him to the login page
2. There are 4 pages for the administrator:
	List Users page
		Shows the list of the users in the form the table, 
		each row contains the following:
		
			1. First name
			
			2. Last name
			
			3. Username
			
			4. Edit link
			
			5. Status toggle (if the user status is "Active", displays "Disable", and vice versa)
			
			6. Delete link/button
			
		The list of the users is displayed with pagination, page numbers, first, previous, next, last links, 
		and selectbox containing 10/20/50 users per page, selecting one of the options will refresh the page 
		displaying correponding number of records per page
		(Faker / or other data generator can be used to generate at least 200 users to test pagination)
		Clicking Active/Disabled link should activate/disable the user (disabled users cannot log in) (refresh the page or use ajax)
		Clicking Delete should delete the user (refresh the page or use ajax)
		Clicking Edit page will redirect the user to the edit page	
		
	Edit Users page
		Displays form with the following user information:
		
		1. First name
		
		2. Last name
		
		3. Description (textarea)
		
		
		Rules:
		
		1. All fields are mandatory except description
		2. If validation fails, corresponding error messages should be shown (wording doesn't matter)
		3. If validation is successful, user data should be saved, administrator will be redirected to the list page
	
	Roles functionality
		Also I have integrate multiple role and premissions functionality.
## Getting Started
	For install the project to your local machine
	1.Clone Repository to your localserver core folder.
	2.Go to project/database folder and find demoapp.sql
	3.Import demoapp.sql via import functionality or run manualy the code in demoapp.sql
	4.Go to project directory and open .env file
	5.Configure datbase, host, and mail settings (by default database name is demoapp)
	6.If you use standart apache withouth redirections you can go by url 
	http://localhost/{project_folder_name}/public/
### Administrator
username: admin
password: Qw123456
### User
username:user
password:Qw123456
