require 'rails_helper'

RSpec.describe Task, type: :model do

  #As a programmer, I can create a new Task record with a title, which is a string, and description, which is a string
  it "can be created and saved and have a title and a description" do
    task_1 = Task.new(title: "first task", description: "this is my first task")
    expect(task_1.save).to eq true
    #the code below finds if there is a row(aka Task object) that has 'first task' in its title, and then loads that object (aka table row) into the variable task_2. This find_by_title could be replaced with find_by_description, find_by_id, find_by_is_done)
    task_2 = Task.find_by_title("first task")
    expect(task_2.description).to eq "this is my first task"
  end

  #As a programmer, I can list all Task records.
  it "shows me all task records" do
    task_1 = Task.new(title: "first task", description: "this is my first task")
    task_1.save
    task_2 = Task.new(title: "second task", description: "this is my second task")
    task_2.save
    expect(Task.all).to match_array [Task.find_by_title("first task"), Task.find_by_title("second task")]
  end

  #As a programmer, I can set a Task record to done given the ID of the record.
  it "can be set to done given the ID of the record" do
    task_1 = Task.new(title: "first task", description: "this is my first task", is_done: 'false')
    task_1.save
    t1_done = Task.find_by_title("first task")
    expect(t1_done.is_done).to eq 'false'
  end

  #As a programmer, I can list all the records that are done.
  it "can list all the task that are done" do
    task_1 = Task.new(title: "first task", description: "this is my first task", is_done: 'true')
    task_1.save
    task_2 = Task.new(title: "second task", description: "this is my second task", is_done: 'true')
    task_2.save

    expect(Task.where(is_done: 'true')).to match_array [Task.find_by_title("first task"),Task.find_by_title("second task")]
  end

  #As a programmer, I can list all the records that are not done.

  it "can list all the task that are not done" do
    task_1 = Task.new(title: "first Task", description:"My first task", is_done:"false")
    task_1.save
    task_2 = Task.new(title: "second Task", description:"My second task", is_done:"false")
    task_2.save
    expect(Task.where(is_done:"false")).to match_array [Task.find_by_title( "first Task"), Task.find_by_title( "second Task")]
  end

  #As a programmer, I can update the title and description of a Task record given the ID of the record.
end#end of RSpec
