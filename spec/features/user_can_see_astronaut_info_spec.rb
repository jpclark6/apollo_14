require 'rails_helper'

describe 'as a user' do
  describe 'when visiting astronaut page' do
    before(:each) do
      @name_1 = "Neil Armstrong"
      @age_1 = 49
      @job_1 = "Commander"
      @name_2 = "John Adams"
      @age_2 = 104
      @job_2 = "Touring"
      @title_1 = "To the moon"
      @time_1 = 47
      @title_2 = "Alpha Centari"
      @time_2 = 4
      @astronaut_1 = Astronaut.create(name: @name_1, age: @age_1, job: @job_1)
      @astronaut_2 = Astronaut.create(name: @name_2, age: @age_2, job: @job_2)
      @mission_1 = Mission.create(title: @title_1, time_in_space: @time_1, astronauts: [@astronaut_1, @astronaut_2])
      @mission_2 = Mission.create(title: @title_2, time_in_space: @time_2, astronauts: [@astronaut_1])
    end

    it 'can see astronauts name, age, and job' do
      visit astronauts_path

      expect(page).to have_content(@name_1)
      expect(page).to have_content(@name_2)
      expect(page).to have_content(@job_1)
      expect(page).to have_content(@job_2)
      expect(page).to have_content(@age_1)
      expect(page).to have_content(@age_2)
    end

    it 'can see a list of each astronauts missions' do
      visit astronauts_path

      t1 = page.body =~ /Alpha Centari/
      t2 = page.body =~ /To the moon/
      expect(t1 < t2).to eq(true)

      within "#astronaut-#{@astronaut_1.id}" do
        expect(page).to have_content(@title_1)
        expect(page).to have_content(@title_2)
      end
      within "#astronaut-#{@astronaut_2.id}" do
        expect(page).to have_content(@title_1)
        expect(page).to have_no_content(@title_2)
      end
    end

    it 'can see total time in space for each astronaut' do
      visit astronauts_path

      total_time_1 = @time_1 + @time_2
      total_time_2 = @time_1

      within "#astronaut-#{@astronaut_1.id}" do
        expect(page).to have_content("Total time in space: #{total_time_1}")
      end

      within "#astronaut-#{@astronaut_2.id}" do
        expect(page).to have_content("Total time in space: #{total_time_2}")
      end
    end
  end
end
