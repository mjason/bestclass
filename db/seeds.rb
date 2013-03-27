# coding: utf-8

Handout.destroy_all
User.destroy_all
Course.destroy_all
Work.destroy_all

# 创建一个老师
User.create(email: "teacher@teacher.com", password: "123123123", name: "teacher")

# 创建用户
students = []
10.times do |number|
  students << User.create(email: "test#{number}@test.com", name: "name#{number}", password: "123123123")
end

# 创建课程
ruby_courses =  Course.new(
  name: "ruby开发入门"
  )

ruby_courses.teacher = User.first
ruby_courses.students << students
ruby_courses.save

ruby_one = Handout.new(title: "第一课ruby开发入门")
ruby_one.course = ruby_courses
ruby_one.accessory.store!(File.open("#{Rails.root}/db/test_file/ruby/one.ppt"))
ruby_one.save
ruby_one.to_pdf
ruby_one.to_swf
ruby_one.save


# 创建一个作业
ruby_work = Work.new(title: "搭建ruby的环境")
ruby_work.course = ruby_courses
ruby_work.accessory.store!(File.open("#{Rails.root}/db/test_file/ruby/diyicizuoye.txt"))
ruby_work.save

# 创建第二次作业
ruby_work = Work.new(title: "基础语法练习")
ruby_work.course = ruby_courses
ruby_work.accessory.store!(File.open("#{Rails.root}/db/test_file/ruby/diyicizuoye.txt"))
ruby_work.save