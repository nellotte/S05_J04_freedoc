class CreateJoinTableDoctorSpecialties < ActiveRecord::Migration[7.1]
  def change
    create_table :join_table_doctor_specialties do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :specialty, index: true
      t.timestamps
    end
  end
end
