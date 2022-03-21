require "application_system_test_case"

class AttendancesTest < ApplicationSystemTestCase
  setup do
    @attendance = attendances(:one)
  end

  test "visiting the index" do
    visit attendances_url
    assert_selector "h1", text: "Attendances"
  end

  test "should create attendance" do
    visit attendances_url
    click_on "New attendance"

    fill_in "Check in", with: @attendance.check_in
    fill_in "Check out", with: @attendance.check_out
    fill_in "Employee private number", with: @attendance.employee_private_number
    click_on "Create Attendance"

    assert_text "Attendance was successfully created"
    click_on "Back"
  end

  test "should update Attendance" do
    visit attendance_url(@attendance)
    click_on "Edit this attendance", match: :first

    fill_in "Check in", with: @attendance.check_in
    fill_in "Check out", with: @attendance.check_out
    fill_in "Employee private number", with: @attendance.employee_private_number
    click_on "Update Attendance"

    assert_text "Attendance was successfully updated"
    click_on "Back"
  end

  test "should destroy Attendance" do
    visit attendance_url(@attendance)
    click_on "Destroy this attendance", match: :first

    assert_text "Attendance was successfully destroyed"
  end
end
