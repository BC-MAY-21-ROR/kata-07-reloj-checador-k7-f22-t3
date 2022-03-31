# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Attendance.destroy_all
Employee.destroy_all
CompanyBranch.destroy_all

CompanyBranch.create(name: 'New york city', address: Faker::Address.full_address)
50.times{
    Employee.create(
        name: Faker::Name.name,
        position: Faker::Job.position,
        email: Faker::Internet.email,
        employee_number: Faker::Number.number(digits: 5),
        private_number: Faker::Number.number(digits: 6),
        company_branch_id: CompanyBranch.last.id,
        is_active: true
    )
}

50.times{ |d|
    employee_id = rand(Employee.first.id..Employee.last.id)
    Attendance.create(employee_id: employee_id, check_in: Time.now.midnight-d.day+rand(5..8).hours, check_out: Time.now.midnight-d.day+rand(13..16).hours)
}