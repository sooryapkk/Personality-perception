# Generated by Django 3.2.24 on 2024-05-17 09:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('perception_app', '0003_alter_tips_table_tips'),
    ]

    operations = [
        migrations.CreateModel(
            name='Upload_History',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('file', models.FileField(upload_to='')),
                ('date', models.DateField()),
                ('result', models.CharField(max_length=50)),
                ('USER', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='FROMID', to='perception_app.user_table')),
            ],
        ),
    ]
