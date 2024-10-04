package models

type User struct {
	Id                string `bson:"_id,omitempty" json:"_id,omitempty"`
	FirstName         string `bson:"firstname" json:"firstname"`
	MiddleName        string `bson:"middlename" json:"middlename"`
	LastName          string `bson:"lastname" json:"lastname"`
	NickName          string `bson:"nickname" json:"nickname"`
	MobileNumber      string `bson:"mobilenumber" json:"mobilenumber"`
	EmergencyNumber   string `bson:"emergencynumber" json:"emergencynumber"`
	Email             string `bson:"email" json:"email"`
	Password          string `bson:"password" json:"password"`
	ConfirmPassword   string `bson:"confirmpassword" json:"confirmpassword"`
	PermanentAddress  string `bson:"permanentaddress" json:"permanentaddress"`
	CurrentAddress    string `bson:"currentaddress" json:"currentaddress"`
	SocietyName       string `bson:"societyname" json:"societyname"`
	Block             string `bson:"block" json:"block"`
	FlatNumber        string `bson:"flatnumber" json:"flatnumber"`
}
