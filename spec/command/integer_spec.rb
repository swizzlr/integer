require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Spec do

    #-------------------------------------------------------------------------#

    describe "CLAide" do
      it "registers it self" do
        Command.parse(%w{ try }).should.be.instance_of Command::Try
      end

      it "presents the help if no name is provided" do
        command = Pod::Command.parse(['try'])
        should.raise CLAide::Help do
          command.validate!
        end.message.should.match /A Pod name or URL is required/
      end

      it "runs if passed in an Pod name" do
        Config.instance.skip_repo_update = false
        command = Pod::Command.parse(['try', 'ARAnalytics'])
        Installer::PodSourceInstaller.any_instance.expects(:install!)
        command.expects(:update_specs_repos)
        command.expects(:pick_demo_project).returns("/tmp/Proj.xcodeproj")
        command.expects(:open_project).with('/tmp/Proj.xcodeproj')
        command.run
      end

      it "runs if passed in a git repository URL" do
        Config.instance.skip_repo_update = false
        command = Pod::Command.parse(['try', 'https://github.com/orta/ARAnalytics.git'])
        Installer::PodSourceInstaller.any_instance.expects(:install!)
        command.expects(:update_specs_repos)
        command.expects(:pick_demo_project).returns("/tmp/Proj.xcodeproj")
        command.expects(:open_project).with('/tmp/Proj.xcodeproj')
        command.run
      end

    end

    #-------------------------------------------------------------------------#
