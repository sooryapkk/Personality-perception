"""personality_percetion URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from perception_app import views

#-----------ADMIN----------------------------------------------------------------------------
urlpatterns = [
    path('', views.login,name='login'),
    path('logincode', views.logincode,name='logincode'),

    path('addexpert', views.addexpert,name='addexpert'),
    path('addexpertcode', views.addexpertcode,name='addexpertcode'),
    path('editexpert/<int:id>', views.editexpert,name='editexpert'),
    path('editexpertcode', views.editexpertcode,name='editexpertcode'),
    path('addmanageexpert',views.addmanageexpert,name='addmanageexpert'),
    path('addmanageexpertsearch',views.addmanageexpertsearch,name='addmanageexpertsearch'),
    path('adminhome', views.adminhome, name='adminhome'),
    path('viewuser',views.viewuser,name='viewuser'),
    path('viewusersearch',views.viewusersearch,name='viewusersearch'),
    path('viewcmpltsntrply',views.viewcmpltsntrply,name='viewcmpltsntrply'),
    path('reply/<int:id>',views.reply,name='reply'),
    path('sendreplycode',views.sendreplycode,name='sendreplycode'),

    path('viewfeedback',views.viewfeedback,name='viewfeedback'),
    path('viewfeedbacksearch',views.viewfeedbacksearch,name='viewfeedbacksearch'),
    path('logout',views.logout,name='logout'),
#------------EXPERT---------------------------------------------------------------------------
    path('viewcmpltexpert',views.viewcmpltexpert,name='viewcmpltexpert'),
    path('addmanagetips',views.addmanagetips,name='addmanagetips'),
    path('addmanagetipssearch',views.addmanagetipssearch,name='addmanagetipssearch'),
    path('addexpertcode',views.addexpertcode,name='addexpertcode'),
    path('edittips',views.edittips,name='edittips'),
    path('add',views.add,name='add'),
    path('edit/<int:id>',views.edit,name='edit'),
    path('viewfeedbackexpert',views.viewfeedbackexpert,name='viewfeedbackexpert'),
    path('viewfeedbackexpertsearch',views.viewfeedbackexpertsearch,name='viewfeedbackexpertsearch'),
    path('experthome',views.experthome,name='experthome'),
    path('delete/<int:id>',views.delete,name='delete'),
    path('Expert_delete_tips/<int:id>',views.Expert_delete_tips,name='Expert_delete_tips'),
    path('addtips',views.addtips,name='addtips'),
    path('view_expert',views.view_expert,name='view_expert'),
    path('in_message2',views.in_message2,name='in_message2'),
    path('view_message2',views.view_message2,name='view_message2'),


path('chatwithuser', views.chatwithuser, name='chatwithuser'),
path('chatview', views.chatview, name='chatview'),
path('coun_msg/<int:id>', views.coun_msg, name='coun_msg'),
path('coun_insert_chat/<str:msg>/<int:id>', views.coun_insert_chat, name='coun_insert_chat'),



#---------------------user-----------------------------------------------------------




path('and_logincode', views.and_logincode, name='and_logincode'),
path('view_complaints_reply', views.view_complaints_reply, name='view_complaints_reply'),
path('view_expert', views.view_expert, name='view_expert'),
path('view_tips', views.view_tips, name='view_tips'),
path('send_feedback', views.send_feedback, name='send_feedback'),
path('send_complants_reply', views.send_complants_reply, name='send_complants_reply'),
path('user_registration', views.user_registration, name='user_registration'),
path('forgot_password', views.forgot_password, name='forgot_password'),
path('change_password', views.change_password, name='change_password'),
path('user_predict', views.user_predict, name='user_predict'),



]
