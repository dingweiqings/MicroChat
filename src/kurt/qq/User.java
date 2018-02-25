package kurt.qq;
public class User implements java.io.Serializable
{
private static final long serialVersionUID = 1L;
int id=0;
String name="";
String password="";
String mobilenumber="";
int  age=0;
String  school="";
String email=""; 
String location="";
String homeland="";
String hobby="";

/**
 * @param id
 * @param name
 * @param password
 * @param mobilenumber
 * @param age
 * @param school
 * @param email
 * @param location
 * @param homeland
 * @param hobby
 */
public User(){
	
	
}
public User(int id, String name, String password, String mobilenumber,
		int age, String school, String email, String location, String homeland,
		String hobby) {
	
	this.id = id;
	this.name = name;
	this.password = password;
	this.mobilenumber = mobilenumber;
	this.age = age;
	this.school = school;
	this.email = email;
	this.location = location;
	this.homeland = homeland;
	this.hobby = hobby;
}

public int getId(){
	return id;
	
}
public void setId(int id){
	this.id=id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = MyTools.toChinese(name);
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getMobilenumber() {
	return mobilenumber;
}
public void setMobilenumber(String number) {
	this.mobilenumber = number;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
public String getSchool() {
	return school;
}
public void setSchool(String school) {
	this.school = school;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}
public String getHomeland() {
	return homeland;
}
public void setHomeland(String homeland) {
	this.homeland = homeland;
}
public String getHobby() {
	return hobby;
}
public void setHobby(String hobby) {
	this.hobby = hobby;
}

}
