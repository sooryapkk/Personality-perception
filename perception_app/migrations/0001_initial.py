# Generated by Django 3.2.24 on 2024-02-26 08:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='expert_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fname', models.CharField(max_length=100)),
                ('lname', models.CharField(max_length=100)),
                ('place', models.CharField(max_length=100)),
                ('post', models.CharField(max_length=100)),
                ('pin', models.IntegerField()),
                ('phone', models.BigIntegerField()),
                ('Email', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='login_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=100)),
                ('password', models.CharField(max_length=100)),
                ('Type', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='user_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Fname', models.CharField(max_length=100)),
                ('Lname', models.CharField(max_length=100)),
                ('place', models.CharField(max_length=100)),
                ('post', models.CharField(max_length=100)),
                ('pin', models.IntegerField()),
                ('phone', models.BigIntegerField()),
                ('Email', models.CharField(max_length=100)),
                ('DOB', models.DateField()),
                ('Photo', models.FileField(upload_to='')),
                ('LOGIN', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='perception_app.login_table')),
            ],
        ),
        migrations.CreateModel(
            name='tips_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tips', models.CharField(max_length=100)),
                ('date', models.DateField()),
                ('EXPERT', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='perception_app.expert_table')),
            ],
        ),
        migrations.CreateModel(
            name='feedback_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('feedback', models.CharField(max_length=100)),
                ('rating', models.IntegerField()),
                ('date', models.DateField()),
                ('USER', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='perception_app.user_table')),
            ],
        ),
        migrations.AddField(
            model_name='expert_table',
            name='LOGIN',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='perception_app.login_table'),
        ),
        migrations.CreateModel(
            name='complaint_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('complaint', models.CharField(max_length=100)),
                ('date', models.DateField()),
                ('reply', models.CharField(max_length=100)),
                ('USER', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='perception_app.user_table')),
            ],
        ),
        migrations.CreateModel(
            name='chat_table',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('message', models.CharField(max_length=100)),
                ('date', models.DateField()),
                ('FROMID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='FROMID', to='perception_app.login_table')),
                ('TOID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='TOID', to='perception_app.login_table')),
            ],
        ),
    ]