# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorkTimePolicy, type: :policy do
  let(:user) { User.new }
  let(:vacation_project) { build_stubbed(:project, :vacation) }
  let(:project) { build_stubbed(:project) }

  subject { described_class }

  permissions :create? do
    it 'grants access for non vacation type' do
      expect(described_class).to permit(build_stubbed(:user), WorkTime.new(project: project))
    end

    it 'denies access for vacation type' do
      expect(described_class).not_to permit(build_stubbed(:user), WorkTime.new(project: vacation_project))
    end
  end

  permissions :create_filling_gaps? do
    it 'grants access for non vacation type' do
      expect(described_class).to permit(build_stubbed(:user), WorkTime.new(project: project))
    end

    it 'denies access for vacation type' do
      expect(described_class).not_to permit(build_stubbed(:user), WorkTime.new(project: vacation_project))
    end
  end

  permissions :update? do
    it 'grants access for non vacation type' do
      expect(described_class).to permit(build_stubbed(:user), WorkTime.new(project: project))
    end

    it 'denies access for vacation type' do
      expect(described_class).not_to permit(build_stubbed(:user), WorkTime.new(project: vacation_project))
    end
  end

  permissions :destroy? do
    it 'grants access for non vacation type' do
      expect(described_class).to permit(build_stubbed(:user), WorkTime.new(project: project))
    end

    it 'denies access for vacation type' do
      expect(described_class).not_to permit(build_stubbed(:user), WorkTime.new(project: vacation_project))
    end
  end

  permissions '.scope' do
    let(:user) { create(:user) }
    let(:admin) { create(:user, :admin) }
    let(:manager) { create(:user, :manager) }

    context 'admin or mananger' do
      it 'resolves to all' do
        create(:work_time)

        expect(described_class::Scope.new(admin, WorkTime.all).resolve).to match_array WorkTime.all
        expect(described_class::Scope.new(manager, WorkTime.all).resolve).to match_array WorkTime.all
      end
    end

    context 'normal user' do
      it "resolves to user's work_times and work_times from leaded projects" do
        project = create(:project, leader: user)
        user_work_time = create(:work_time, user: user)
        project_work_time = create(:work_time, project: project)
        expect(described_class::Scope.new(user, WorkTime.all).resolve).to match_array [user_work_time, project_work_time]
      end
    end
  end
end
