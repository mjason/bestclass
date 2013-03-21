# coding: utf-8
require 'spec_helper'

describe Work do

  before(:each) do
    @user1 = FactoryGirl.create(:user) 
    @user2 = FactoryGirl.create(:user)
    @course = FactoryGirl.create(:course)
    @work = FactoryGirl.create(:work, course: @course)
  end

  after(:each) do
    User.destroy_all
    Course.destroy_all
    Work.destroy_all
    Task.destroy_all
  end


  it "user1和user2加入课程" do
    @course.students << @user1
    @course.students << @user2
    @course.students do |student|
      student.id.should == @user1.id
      student.id.should == @user2.id
    end
    @course.students.length.should == 2
    @course.save
  end

  it "user1提交作业是否正确" do
    task1 = @user1.tasks.new
    task1.work = @work
    task1.user_id.should == @user1.id
    task1.work_id.should == @work.id
    task1.save
  end

  it "百分比必须为50%" do
    @course.students << @user1
    @course.students << @user2
    @course.save
    task1 = @user1.tasks.new
    task1.work = @work
    task1.save
    @work.submit_percentage.should == 50
  end  
  
end
