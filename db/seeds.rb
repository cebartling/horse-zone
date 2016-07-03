# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

if Role.where(lookup_code: 'OWNER').count == 0
  Role.create(lookup_code: 'OWNER', name: 'owner')
end

if Role.where(lookup_code: 'INSTRUCTOR').count == 0
  Role.create(lookup_code: 'INSTRUCTOR', name: 'instructor')
end

if Role.where(lookup_code: 'PARTICIPANT').count == 0
  Role.create(lookup_code: 'PARTICIPANT', name: 'participant')
end
