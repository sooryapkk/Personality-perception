import smtplib
from datetime import datetime
from email.mime.text import MIMEText

from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from perception_app.models import *
# Create your views here.

def logout(request):
    auth.logout(request)
    return render(request,"loginindex.html")

def login(request):
    return render(request, 'loginindex.html')
def logincode(request):
    uname=request.POST["uname"]
    password=request.POST["pass"]
    try:
         ob=login_table.objects.get(username=uname,password=password)
         if ob.Type=="admin":
             ob1=auth.authenticate(username='admin',password='admin')
             if ob1 is not None:
                 auth.login(request, ob1)
             return HttpResponse("<script>alert('login success');window.location='/adminhome'</script>")
         elif ob.Type=="expert":
                request.session['lid']=ob.id
                ob1 = auth.authenticate(username='admin', password='admin')
                if ob1 is not None:
                    auth.login(request, ob1)
             #return render(request,'Expert/experthome.html')
                return HttpResponse("<script>alert('login  sucess');window.location='/experthome'</script>")
         else :
         #return render(request,'login.html')
              return HttpResponse("<scrip>alert('Invalid');window.location='/login'</script>")
    except:
        return HttpResponse("<script>alert('Invalid');window.location='/login'</script>")


@login_required(login_url='/')

def adminhome(request):
    return render(request, 'Admin/index.html')

@login_required(login_url='/')

def addexpert(request):
    return render(request, 'Admin/add expert.html')

@login_required(login_url='/')

def addexpertcode(request):
    fname=request.POST["textfield"]
    lname=request.POST["textfield2"]
    place=request.POST["textfield3"]
    post=request.POST["textfield4"]
    pin=request.POST["textfield5"]
    phone=request.POST["textfield6"]
    Email=request.POST["textfield7"]
    uname = request.POST["textfield8"]
    password = request.POST["textfield9"]

    print(Email,"---------")
    ob=login_table()
    ob.username=uname
    ob.password=password
    ob.Type="expert"
    ob.save()
    ob2=expert_table()
    ob2.Email=Email
    ob2.phone=phone
    ob2.pin=pin
    ob2.post=post
    ob2.place=place
    ob2.lname=lname
    ob2.fname=fname
    ob2.LOGIN=ob
    ob2.save()
    return HttpResponse('''<script>alert("sucessfully added");window.location="/addmanageexpert#about"</script>''')
        # except:
        #  return HttpResponse('''<scrip>alert("Invalid");window.location="/login"</script>''')
@login_required(login_url='/')

def editexpert(request, id):
    request.session['e_id'] = id
    ob = expert_table.objects.get(id=id)
    return render(request, 'Admin/edit expert.html', {'val': ob})

@login_required(login_url='/')

def editexpertcode(request):
    fname=request.POST["textfield"]
    lname=request.POST["textfield2"]
    place=request.POST["textfield3"]
    post=request.POST["textfield4"]
    pin=request.POST["textfield5"]
    phone=request.POST["textfield6"]
    Email=request.POST["textfield7"]

    print(Email,"---------")
    ob2=expert_table.objects.get(id=request.session['e_id'])
    ob2.Email=Email
    ob2.phone=phone
    ob2.pin=pin
    ob2.post=post
    ob2.place=place
    ob2.lname=lname
    ob2.fname=fname
    ob2.save()
    return HttpResponse('''<script>alert("sucessfully edited");window.location="/addmanageexpert#about"</script>''')
        # except:
        #  return HttpResponse('''<scrip>alert("Invalid");window.location="/login"</script>''')

@login_required(login_url='/')

def addmanageexpert(request):
    ob=expert_table.objects.all()
    return render(request, 'Admin/add&manage expert.html',{"data":ob})

@login_required(login_url='/')

def addmanageexpertsearch(request):
    name=request.POST['textfield']
    ob=expert_table.objects.filter(fname__istartswith=name)
    return render(request, 'Admin/add&manage expert.html',{"data":ob})


@login_required(login_url='/')

def viewuser(request):
    ob=user_table.objects.all()
    return render(request, 'Admin/view user.html',{"data":ob})
@login_required(login_url='/')

def viewusersearch(request):
    name= request.POST['textfield']
    ob=user_table.objects.filter(Fname__istartswith=name)
    return render(request, 'Admin/view user.html',{"data":ob})
@login_required(login_url='/')

def viewcmpltsntrply(request):
    ob=complaint_table.objects.all()
    return render(request, 'Admin/view cmpt&reply.html',{"data":ob})
@login_required(login_url='/')

def reply(request,id):
    request.session['rid']=id
    return render(request,'admin/reply.html')
@login_required(login_url='/')

def sendreplycode(request):
    rep=request.POST['textarea']
    ob=complaint_table.objects.get(id=request.session['rid'])
    ob.reply=rep
    ob.save()
    return HttpResponse('''<script>alert("sucessfully reply sended");window.location="/viewcmpltsntrply#about"</script>''')
@login_required(login_url='/')

def viewfeedback(request):
    ob=feedback_table.objects.all()
    return render(request, 'Admin/view feedback.html',{"data":ob})
@login_required(login_url='/')

def viewfeedbacksearch(request):
    date=request.POST['textfield']
    ob=feedback_table.objects.filter(date=date)
    if len(ob) == 0:
        return HttpResponse('''<script>alert("not found");window.location="/viewfeedback#about"</script>''')
    else:
        return render(request, 'Admin/view feedback.html',{"data":ob,'date': date})
@login_required(login_url='/')


def delete(request,id):
    ob1=login_table.objects.get(id=id)
    ob1.delete()
    return HttpResponse('''<script>alert("delected");window.location="/addmanageexpert#about"</script>''')





def forgot_password(request):
    print(request.POST)
    try:
        print("1")
        print(request.POST)
        email = request.POST['email']
        print(email)
        s=user_table.objects.get(Email=email)
        # qry = "SELECT `login`.`password` FROM `student`  JOIN `login` ON `login`.`L_id` = `student`.`L_id` WHERE email=%s"
        # s = selectone(qry, email)
        print(s, "=============")
        if s is None:
            data = {"task": "invalid"}
            r = json.dumps(data)
            return HttpResponse(r)

            # return jsonify({'task': 'invalid email'})
        else:
            try:
                gmail = smtplib.SMTP('smtp.gmail.com', 587)
                gmail.ehlo()
                gmail.starttls()
                gmail.login('sooryapk584@gmail.com', 'fjhs gayp srmi yysw')
                print("login=======")
            except Exception as e:
                print("Couldn't setup email!!" + str(e))
            msg = MIMEText("Your  password is : " + str(s.LOGIN.password))
            print(msg)
            msg['Subject'] = 'PERSONALITY PERCEPTION'
            msg['To'] = email
            msg['From'] = 'sooryapk584@gmail.com'

            print("ok====")

            try:
                gmail.send_message(msg)
            except Exception as e:
                data = {"task": "invalid"}
                r = json.dumps(data)
                return HttpResponse(r)
            data = {"task": "success"}
            r = json.dumps(data)
            return HttpResponse(r)
    except Exception as e:
        print(e)
        data = {"task": "invalid"}
        r = json.dumps(data)
        return HttpResponse(r)

@login_required(login_url='/')


#____________________________________________Expert


def addmanagetips(request):
    ob=tips_table.objects.filter(EXPERT__LOGIN__id=request.session['lid'])
    return render(request,'Expert/add&manage tips.html',{'val':ob})
@login_required(login_url='/')


def addmanagetipssearch(request):
    date=request.POST['textfield']
    ob=tips_table.objects.filter(date=date)
    if len(ob) == 0:
        return HttpResponse('''<script>alert("not found");window.location="/addmanagetips#about"</script>''')
    else:
        return render(request,'Expert/add&manage tips.html',{'val':ob, 'date': date})
@login_required(login_url='/')

def Expert_delete_tips(request,id):
    ob2=tips_table.objects.get(id=id)
    ob2.delete()
    return HttpResponse('''<script>alert("delected");window.location="/addmanagetips#about"</script>''')
@login_required(login_url='/')

def add(request):
    ob=tips_table.objects.all()
    return render(request, 'Expert/add tips.html',{"data":ob})
@login_required(login_url='/')

def addtips(request):
    a=request.POST['textarea']
    ob=tips_table()
    ob.tips=a
    ob.date=datetime.now()
    ob.EXPERT=expert_table.objects.get(LOGIN__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("ADDED");window.location="/addmanagetips#about"</script>''')
@login_required(login_url='/')

def edit(request,id):
    request.session['pp']=id
    ob=tips_table.objects.get(id=id)
    return render(request, 'Expert/edit tips.html',{"data":ob})
@login_required(login_url='/')

def edittips(request):
    a=request.POST['textarea']
    ob=tips_table.objects.get(id=request.session['pp'])
    ob.tips=a
    ob.save()
    return HttpResponse('''<script>alert("Edited");window.location="/addmanagetips#about"</script>''')
@login_required(login_url='/')

def viewcmpltexpert(request):
    ob=complaint_table.objects.all()
    return render(request, 'Expert/view cmpt expert.html',{"data":ob})
@login_required(login_url='/')





def viewfeedbackexpert(request):
    ob = feedback_table.objects.all()
    return render(request, 'Expert/view feedback expert.html', {'val': ob})

def viewfeedbackexpertsearch(request):
    date = request.POST['textfield']
    ob = feedback_table.objects.filter(date=date)
    if len(ob) == 0:
        return HttpResponse('''<script>alert("not found");window.location="/viewfeedbackexpert#about"</script>''')
    else:
        return render(request, 'Expert/view feedback expert.html',{'val':ob, 'date': date})

def experthome(request):
    return render(request, 'Expert/expertindex.html')


#________________________chatstyle------------------------------

def chatwithuser(request):
    ob = user_table.objects.all()
    return render(request,"Expert/fur_chat.html",{'val':ob})




def chatview(request):
    ob = user_table.objects.all()
    d=[]
    for i in ob:
        r={"name":i.Fname+""+i.Lname,'photo':i.Photo.url,'email':i.Email,'loginid':i.LOGIN.id}
        d.append(r)
    return JsonResponse(d, safe=False)




def coun_insert_chat(request,msg,id):
    print("===",msg,id)
    ob=chat_table()
    ob.FROMID=login_table.objects.get(id=request.session['lid'])
    ob.TOID=login_table.objects.get(id=id)
    ob.message=msg
    ob.date=datetime.now().strftime("%Y-%m-%d")
    ob.save()

    return JsonResponse({"task":"ok"})
    # refresh messages chatlist



def coun_msg(request,id):

    ob1=chat_table.objects.filter(FROMID__id=id,TOID__id=request.session['lid'])
    ob2=chat_table.objects.filter(FROMID__id=request.session['lid'],TOID__id=id)
    combined_chat = ob1.union(ob2)
    combined_chat=combined_chat.order_by('id')
    res=[]
    for i in combined_chat:
        res.append({"from_id":i.FROMID.id,"msg":i.message,"date":i.date,"chat_id":i.id})

    obu=user_table.objects.get(LOGIN__id=id)


    return JsonResponse({"data":res,"name":obu.Fname+" "+obu.Lname,"photo":obu.Photo.url,"user_lid":obu.LOGIN.id})
#========================================webservices
import json
def and_logincode(request):
    uname=request.POST["uname"]
    password=request.POST["pswd"]
    try:
         ob=login_table.objects.get(username=uname,password=password)
         data={"task":"success","lid":ob.id}
         r=json.dumps(data)
         return HttpResponse(r)


    except:
        data = {"task": "invalid"}
        r = json.dumps(data)
        return HttpResponse(r)

def user_registration(request):
    fname=request.POST['Fname']
    lname=request.POST['Lname']
    place=request.POST['place']
    post=request.POST['post']
    pin=request.POST['pin']
    phone=request.POST['phone']
    email=request.POST['email']
    dob=request.POST['DOB']
    photo=request.FILES['photo']
    fp=FileSystemStorage()
    fs=fp.save(photo.name,photo)
    uname=request.POST['uname']
    password=request.POST['password']
    ob=login_table()
    ob.username = uname
    ob.password = password
    ob.Type="user"
    ob.save()

    ob2=user_table()
    ob2.DOB=dob
    ob2.Photo=fs
    ob2.Email = email
    ob2.phone = phone
    ob2.pin = pin
    ob2.post = post
    ob2.place = place
    ob2.Lname = lname
    ob2.Fname = fname
    ob2.LOGIN = ob
    ob2.save()
    data = {"task": "success"}
    r = json.dumps(data)
    return HttpResponse(r)
def send_complants_reply(request):
    complaint=request.POST['complaints']
    lid=request.POST["lid"]


    ob3=complaint_table()
    ob3.complaint=complaint
    ob3.date=datetime.now().date()
    ob3.reply="pending"
    ob3.USER=user_table.objects.get(LOGIN=lid)

    ob3.save()
    data = {"task": "success"}
    r = json.dumps(data)
    return HttpResponse(r)


def change_password(request):
    curpas=request.POST['curpass']
    nwpass=request.POST['nwpass']
    cpass = request.POST["cpass"]
    lid = request.POST["lid"]
    ob=login_table.objects.get(id=lid)
    if ob.password==curpas:
        if nwpass==cpass:
            ob.password=cpass
            ob.save()
            data = {"task": "success"}
            r = json.dumps(data)
            return HttpResponse(r)
        else:
            data = {"task": "doesnt"}
            r = json.dumps(data)
            return HttpResponse(r)
    else:
        data = {"task": "old"}
        r = json.dumps(data)
        return HttpResponse(r)






def send_feedback(request):
    feedback=request.POST['feedback']
    rating=request.POST['rating']
    lid = request.POST["lid"]

    ob=feedback_table()
    ob.feedback=feedback
    ob.date=datetime.now().date()
    ob.rating=rating
    ob.USER=user_table.objects.get(LOGIN=lid)
    ob.save()
    data = {"task": "success"}
    r = json.dumps(data)
    return HttpResponse(r)


def view_tips(request):
    tid=request.POST['tid']
    ob=tips_table.objects.filter(EXPERT__id=tid)
    data=[]
    for i in ob :
        row = {"tip":i.tips,"date":str(i.date),"expert":i.EXPERT.fname+" "+i.EXPERT.lname}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def view_complaints_reply(request):
    lid=request.POST["lid"]
    ob=complaint_table.objects.filter(USER__LOGIN=lid)
    data=[]
    for i in ob :
        row={"complaints":i.complaint,"date":str(i.date),"reply":i.reply}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)
def view_expert(request):
    ob=expert_table.objects.all()
    data=[]
    for i in ob:
        row = {"name":i.fname+" "+i.lname,"phone":i.phone,"id":i.id,"email":i.Email,"lid":i.LOGIN.id}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)




def in_message2(request):
    print(request.POST)
    fromid = request.POST['fid']
    print("fromid",fromid)
    toid = request.POST['toid']
    print("toid",toid)

    message=request.POST['msg']
    ob=chat_table()
    ob.FROMID=login_table.objects.get(id=fromid)
    ob.TOID=login_table.objects.get(id=toid)
    ob.message=message
    ob.date=datetime.today()
    # ob.time=datetime.datetime.now()
    ob.save()
    data = {"status": "send"}
    r = json.dumps(data)
    return HttpResponse(r)


def view_message2(request):
    print(request.POST)
    fromid=request.POST['fid']
    toid=request.POST['toid']
    mid=request.POST['lastmsgid']
    print(mid,"uuuuuuuuuuuu0")
    ob=chat_table.objects.filter(Q(TOID__id=toid,FROMID__id=fromid,id__gt=mid)|Q(TOID=fromid,FROMID=toid,id__gt=mid)).order_by('id')
    print(ob,"YYYYYYYYYYYYYYYYYYYYYYYYYYYYYY")
    data=[]
    print("++++++++==============================")
    print("++++++++==============================")
    print("++++++++==============================")
    for i in ob:
        r={"id":i.id,"date":str(i.date),"chat":i.message,"fromid":i.FROMID.id}
        data.append(r)
        print(r,"KKKKKKKKKKKKKKKKKKKKKKKKKKKK")
    # print(data,"JJJJJJJJJJJJJJJJJJJJJJJJJ")
    print(len(data),"=========================================")
    if len(data)>0:
        return JsonResponse({"status":"ok","res1":data})
    else:
        return JsonResponse({"status": "na"})


import joblib
import os
import time
def user_predict(request):
    print(request.FILES)
    l=['OAF_angry', 'OAF_disgust', 'OAF_Fear', 'OAF_happy', 'OAF_neutral', 'OAF_Pleasant_surprise', 'OAF_Sad']
    lid=request.POST["lid"]
    file=request.FILES["file"]

    fs=FileSystemStorage()
    fsave=fs.save(file.name,file)
    fl=str(fsave).split('.')

    ffl = time.strftime("%Y%m%d_%H%M%S")
    # req = time.strftime("%Y%m%d_%H%M%S") + "." + str(fl[1])
    req = time.strftime("%Y%m%d_%H%M%S") + "." + str(fl[-1])
    # fs.save(os.path.join(r'C:\Users\Administrator\PycharmProjects\personality_percetion\media\audio', req), file)
    # fn.save(req,req)
    print(req, "++++++=====++++====+++")
    print("====ff1=====", ffl)
    os.system('ffmpeg -i media\\' + str(fsave) + ' media\\' + ffl + ".wav")
    # ans = "no answer"
    # try:
    #     ans = silence_based_conversion(ffl)
    # except:
    #     pass
    print(fsave)
    feat=featureextract(r"C:\Users\Administrator\PycharmProjects\personality_percetion\media/"+ ffl + ".wav")
    knn_from_joblib = joblib.load("knnmodel.pkl")

    # Use the loaded model to make predictions
    res=l[knn_from_joblib.predict(feat)[0]].split("_")[1]
    ob=Upload_History()
    ob.USER=user_table.objects.get(LOGIN__id=lid)
    ob.file=fsave
    ob.date=datetime.today()
    ob.result=res
    ob.save()
    ob=Upload_History.objects.filter(USER__LOGIN__id=lid)
    df={'joy':0,"anger":0,"sadness":0,"fear":0}
    # l = ['OAF_angry', 'OAF_disgust', 'OAF_Fear', 'OAF_happy', 'OAF_neutral', 'OAF_Pleasant_surprise', 'OAF_Sad']
    print(res)
    for i in ob:
        if i.result=='angry':
            df['anger']+=1
        elif i.result=='Sad' or i.result=='disgust':
            df['sadness']+=1
        elif i.result=='Fear':
            df['fear']+=1
        else:
            df['joy'] += 1



    df['mean_emotion'] = (df['joy']+ df['anger']+ df['sadness']+ df['fear'])/len(ob)
    df['extraversion'] = df['joy'] - df['sadness']
    df['agreeableness'] = df['joy'] - df['anger']
    df['openness'] = df['joy'] - df['fear']
    df['conscientiousness'] = df['joy'] - (df['anger'] + df['sadness'])
    df['neuroticism'] = df['sadness'] + df['anger'] + df['fear']

    # Aggregate personality trait scores over the period
    personality_traits = {
        'extraversion': df['extraversion'] ,
        'agreeableness': df['agreeableness'] ,
        'openness': df['openness'] ,
        'conscientiousness': df['conscientiousness'],
        'neuroticism': df['neuroticism'],
    }
    ts=df['extraversion'] + df['agreeableness'] + df['openness']+ df['conscientiousness']+df['neuroticism']
    personality_traits = {
        'extraversion': round((df['extraversion']/ts)*100,2),
        'agreeableness': round((df['agreeableness']/ts)*100,2),
        'openness': round((df['openness']/ts)*100,2),
        'conscientiousness': round((df['conscientiousness']/ts)*100,2),
        'neuroticism': round((df['neuroticism']/ts)*100,2),
    }
    print(df)
    print(personality_traits)
    print(res)
    return JsonResponse({"task":str(personality_traits)})
    return JsonResponse({"task":res})

    # def voice(request):
    #     print("=================================heloooo======================================")
    #     scrid = request.POST['scid']
    #     lid = request.POST['lid']
    #     qid = request.POST['qid']
    #     tid = request.POST['tid']
    #     file = request.FILES['file']
    #     im = request.FILES['file1']
    #     fn = FileSystemStorage()
    #     image = fn.save(im.name, im)
    #     # image = secure_filename(im.filename)
    #     import time
    #     ffl = time.strftime("%Y%m%d_%H%M%S")
    #     reg = time.strftime("%Y%m%d_%H%M%S") + ".jpg"
    #     kk = "pic.jpg"
    #     fn.save(os.path.join(r'C:\Users\91953\PycharmProjects\mockinterview\media\emotion', reg), im)
    #     ff = fn.save(file.name, file)
    #     # ff = secure_filename(file.filename)
    #     print(ff)
    #     fl = ff.split('.')
    #     # print(fl[1])
    #     # import time
    #     ffl = time.strftime("%Y%m%d_%H%M%S")
    #     req = time.strftime("%Y%m%d_%H%M%S") + "." + str(fl[1])
    #     fn.save(os.path.join(r'C:\Users\91953\PycharmProjects\mockinterview\media\audio', req), file)
    #     # fn.save(req,req)
    #     print(req, "++++++=====++++====+++")
    #     print("====ff1=====", ffl)
    #     os.system('ffmpeg -i media\\audio\\' + req + ' media\\audio\\' + ffl + ".wav")
    #     ans = "no answer"
    #     try:
    #         ans = silence_based_conversion(ffl)
    #     except:
    #         pass
    #     print("ans", ans)
    #     q = Questions.objects.get(id=qid)
    #     oans = q.Answer
    #     print(oans)
    #     mark = 10
    #
    #     sim = checkans(oans, ans)
    #     omark = sim * mark
    #     print("omark", omark)
    #     if omark != 0.0:
    #         my_matches = []  # my_tool.check(ans)
    #         print(len(my_matches))
    #         if len(my_matches) > 5 and len(my_matches) < 10:
    #             omark = omark - 0.3
    #         elif len(my_matches) > 10 and len(my_matches) < 20:
    #             omark = omark - 0.6
    #     em = detect_emotion(reg)
    #     print("emotion", em)
    #     qw = answer_details()
    #     qw.ans = ans
    #     qw.emot = em
    #     qw.user = User.objects.get(LOGIN__id=lid)
    #     qw.oans = oans
    #     qw.date = datetime.today()
    #     qw.vac_qn = Questions.objects.get(id=qid)
    #     qw.save()
    #     data = {"task": omark}
    #     r = json.dumps(data)
    #     return HttpResponse(r)

import librosa
import numpy as np
def featureextract(path):
        all_waves=[]
        wave, sr = librosa.load(path, mono=True)
        # samples, sample_rate = librosa.load(train_audio_path + '/' + label + '/' + wav, sr = 6500)

        # samples = librosa.resample(samples, sample_rate, 6500)
        mfcc = librosa.feature.mfcc(wave, sr)
        # samples = np.pad(samples, (0, (6500 - len(samples))), mode='constant', constant_values=0)
        print(len(mfcc[0]), type(mfcc[0]), ")0)0)09(0(0(0(0(0")
        if len(mfcc[0]) < 80:
            mfcc = np.pad(mfcc, ((0, 0), (0, 80 - len(mfcc[0]))), mode='constant', constant_values=0)

        # samples=np.pad(mfcc[0], (0, (15 - len(mfcc[0]))), mode='constant', constant_values=0)
        samples = []
        for i in range(0, 20):
            for j in range(80):
                samples.append(mfcc[i][j])
        if (len(samples) == 80 * 20):
            all_waves.append(list(samples))
            return all_waves