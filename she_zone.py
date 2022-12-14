from flask import Flask, render_template, request,session
from DBConnection import Db

app = Flask(__name__)
app.secret_key="hi"

@app.route('/')
def hello_world():
    return render_template('login.html')

@app.route("/login_post", methods=['post'])
def login_post():
    username=request.form['textfield']
    password=request.form['textfield2']
    d = Db()
    qry = "SELECT * FROM `login` WHERE `username`='"+username+"' AND `password`='"+password+"'"
    res = d.selectOne(qry)
    if res is not None:
        session['lid']=res['login_id']
        if res['usertype']=='admin':
            return '''<script>alert('Login Success');window.location='/adm_home'</script>'''
        elif res['usertype']=='hospital':
            return '''<script>alert('Login Success');window.location='/hospital_home'</script>'''
        elif res['usertype']=='doctor':
            return '''<script>alert('Login Success');window.location='/dochome'</script>'''
        else:
            return '''<script>alert('Invalid User');window.location='/'</script>'''
    else:
        return '''<script>alert('Invalid User');window.location='/'</script>'''



@app.route('/adm_home')
def adm_home():
    return render_template('admin/home.html')

@app.route('/hospital_home')
def hospital_home():
    return render_template('hospital/home.html')

@app.route('/dochome')
def dochome():
    return render_template('doctor/dochome.html')

@app.route('/yogahome')
def yogahome():
    return render_template('Yoga_trainer/yogahome.html')

@app.route('/change_passwrd')
def change_passwrd():
    return render_template('admin/change_password.html')
@app.route('/change_password_post', methods=['post'])
def change_password_post():
    oldpassword=request.form['textfield']
    newpassword=request.form['textfield2']
    confirmpassword=request.form['textfield3']
    db = Db()
    qry = "SELECT * FROM `login` WHERE `password`='"+oldpassword+"'"
    res = db.selectOne(qry)
    if res is not None:
        if newpassword==confirmpassword:
            qry = "UPDATE login SET `password`='"+newpassword+"' WHERE `login_id`='"+str(session['lid'])+"'"
            res = db.update(qry)
            return '''<script>alert('Password Changed');window.location='/'</script>'''
        else:
            return '''<script>alert('Password Mismatch!');window.location='/change_passwrd'</script>'''
    else:
        return '''<script>alert('Current Password must be valid!');window.location='/change_passwrd'</script>'''


@app.route('/Hospita_lRegister')
def Hospit_lRegister():
    return render_template('admin/Hospita_lRegister.html')
@app.route('/Hospita_lRegister_post',methods=['post'])
def Hospita_lRegister_post():
    hospitalname=request.form['textfield']
    place=request.form['textfield2']
    post=request.form['textfield3']
    pin=request.form['textfield4']
    district=request.form['textfield5']
    contactno=request.form['textfield6']
    email=request.form['textfield7']
    hospitaltype=request.form['textfield8']
    password=request.form['textfield9']
    confirmpassword=request.form['textfield10']
    y=Db()
    qry = "insert into login (username,password,usertype)values ('"+email+"','"+password+"','hospital')"
    res=y.insert(qry)
    qry2="insert into hospital(name,place,post,pin,district,contactno,email,hospitaltype,login_id) values('"+hospitalname+"','"+place+"','"+post+"','"+pin+"','"+district+"','"+contactno+"','"+email+"','"+hospitaltype+"','"+str(res)+"')"
    print(qry2)
    res = y.insert(qry2)
    return '''<script>alert('Added');window.location='/Hospita_lRegister'</script>'''

@app.route('/view_hospital')
def view_hospital():
    y =Db()
    qry = "SELECT * FROM `hospital`"
    res =y.select(qry)
    return render_template('admin/view_hospital.html',data=res)




@app.route('/search_hospital', methods=['post'])
def search_hospital():
    db = Db()
    search = request.form['textfield']
    qry = "SELECT * FROM hospital WHERE `name` LIKE '%"+search+"%'"
    res = db.select(qry)
    print(res)
    return view_hospital()



@app.route('/send_reply')
def send_reply():
    return render_template('admin/send_reply.html')
@app.route('/send_reply_post',methods=['post'])
def send_reply_post():
    reply=request.form['textarea']
    return 'okey'

@app.route('/User_View')
def User_View():

    d=Db()
    qry = "SELECT * FROM `user`"
    res = d.select(qry)
    return render_template('admin/User_View.html',data=res)


@app.route('/User_View_post', methods=['post'])
def search_User():
    db = Db()
    search = request.form['textfield']
    qry = "SELECT * FROM user WHERE name LIKE '"+search+"'"
    res = db.select(qry)
    print(res)
    return render_template('admin/User_View.html',data=res)

@app.route('/view_and_aprv_trainer')
def view_and_aprv_trainer():
    a=Db()
    qry = "SELECT * FROM `yogatrainee`"
    res = a.select(qry)
    return render_template('admin/view_and_aprv_trainer.html',data=res)


@app.route('/view_aprvd_trainer')
def view_approved_trainer():
    b=Db()
    qry = "SELECT * FROM `yogatrainee`"
    res = b.select(qry)
    return render_template('admin/view_aprvd_trainer.html',data=res)

@app.route('/view_complaints')
def view_complaints():
    b = Db()
    qry = "SELECT * FROM`complaint`"
    res = b.select(qry)
    return render_template('admin/view_complaints.html', data = res)

@app.route('/view_doctor')
def view_doctor():
    u =Db()
    qry = "SELECT * FROM `doctor`"
    res =u.select(qry)
    return render_template('admin/view_doctor.html',data=res)

@app.route('/add_doctor')
def add_doctor():
    return render_template('hospital/add_doctor.html')
@app.route('/add_doctor_post',methods=['post'])
def add_doctor_post():
    Name=request.form['textfield']
    Email=request.form['textfield2']
    phone=request.form['textfield3']
    gender=request.form['radio']
    # department=request.form['select']
    qualification=request.form['textfield4']
    photo=request.files['filFieled']
    photo.save("C:\\Users\\user\\PycharmProjects\\she_zone\\static"+photo.filename)
    fil= "\static" +photo.filename
    exp=request.form['experience']

    x = Db()
    qry = "insert into login (username,password,usertype)values ('"+Email+"','"+phone+"','doctor')"
    res =x.insert(qry)
    qry1 ="insert into doctor(hospitalid,doctorname,contactno,gender,qualification,experience,photo,login_id)values('"+str(session['lid'])+"','"+Name+"','"+phone+"','"+gender+"','"+qualification+"','"+exp+"','"+fil+"','"+str(res)+"')"
    res1 = x.insert(qry1)
    return '''<script>alert('Addedd');window.location='/add_Dcotor'</script>'''


@app.route('/add_schedule')
def add_schedule():
    return render_template('hospital/add_schedule.html')
@app.route('/add_schedule_post',methods=['post'])
def add_schedule_post():
    doctor=request.form['select']
    day=request.form['select2']
    timefrom=request.form['textfield']
    timeto=request.form['textfield2']

    a = Db()
    # qry = "insert into schedule(date,fromtime,totime,status)values('"++"','"++"')
    return 'ok'

@app.route('/change_password')
def change_password():
    return render_template('hospital/change_password.html')

@app.route('/edit_doctor')
def edit_doctor():
    return render_template('hospital/edit_doctor.html')

@app.route('/view_doctors')
def view_doctors():
    return render_template('hospital/view_doctors.html')

@app.route('/view_profile')
def view_profile():
    return render_template('hospital/view_profile.html')

@app.route('/view_schedule')
def view_schedule():
    return render_template('hospital/view_schedule.html')



@app.route('/Add_awareness_video')
def Add_awareness_video():
    return render_template('doctor/Add_awareness_video.html')

@app.route('/Add_healthtips')
def Add_healthtips():
    return render_template('doctor/Add_healthtips.html')

@app.route('/doctorchangepassword')
def doctorchangepassword():
    return render_template('doctor/doctorchangepassword.html')

@app.route('/Dr_Viewbooking_and_confirm')
def Dr_Viewbooking_and_confirm():
    return render_template('doctor/Dr_Viewbooking_and_confirm.html')

@app.route('/View_awareness_video')
def View_awareness_video():
    return render_template('doctor/View_awareness_video.html')

@app.route('/View_healthtips')
def View_healthtips():
    return render_template('doctor/View_healthtips.html')

@app.route('/View_schedule')
def View_schedule():
    return render_template('doctor/View_Shedule.html')



@app.route('/Facilities')
def Facilities():
    return render_template('Yoga_trainer/Facilities.html')

@app.route('/Update_status_of_booking')
def Update_status_of_booking():
    return render_template('Yoga_trainer/Update status of booking.html')

@app.route('/view_booking')
def view_booking():
    return render_template('Yoga_trainer/view Booking.html')

@app.route('/yoga_registration')
def yoga_registration():
    return render_template('Yoga_trainer/yoga registration.html')

@app.route('/yoga_change_password')
def yoga_change_password():
    return render_template('Yoga_trainer/change_password.html')












































































if __name__ == '__main__':
    app.run(debug=True)
