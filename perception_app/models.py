from django.db import models

# Create your models here.

class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    Type=models.CharField(max_length=100)
class expert_table(models.Model):
    fname=models.CharField(max_length=100)
    lname=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    post=models.CharField(max_length=100)
    pin=models.IntegerField()
    phone=models.BigIntegerField()
    Email=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
class user_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    Fname=models.CharField(max_length=100)
    Lname=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    post=models.CharField(max_length=100)
    pin=models.IntegerField()
    phone=models.BigIntegerField()
    Email=models.CharField(max_length=100)
    DOB =models.DateField()
    Photo=models.FileField()
class complaint_table(models.Model):
    USER=models.ForeignKey(user_table,on_delete=models.CASCADE)
    complaint=models.CharField(max_length=100)
    date=models.DateField()
    reply=models.CharField(max_length=100)
class feedback_table(models.Model):
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    feedback=models.CharField(max_length=100)
    rating=models.FloatField()
    date=models.DateField()
class tips_table(models.Model):
    EXPERT=models.ForeignKey(expert_table,on_delete=models.CASCADE)
    tips=models.CharField(max_length=500)
    date=models.DateField()
class chat_table(models.Model):
    FROMID=models.ForeignKey(login_table,on_delete=models.CASCADE,related_name='FROMID')
    TOID=models.ForeignKey(login_table,on_delete=models.CASCADE,related_name='TOID')
    message=models.CharField(max_length=100)
    date=models.DateField()

class Upload_History(models.Model):
    USER=models.ForeignKey(user_table,on_delete=models.CASCADE,related_name='FROMID')
    file=models.FileField()
    date=models.DateField()
    result=models.CharField(max_length=50)
