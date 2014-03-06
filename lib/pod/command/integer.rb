module Pod
  class Command

    # The pod integer command.
    #
    class Integer < Command
      self.summary = "Check in your Pods folder, dummy!"

      self.description = <<-DESC
          Compares the Integer.lock manifest with the Pods/ folder to ensure integrity.
      DESC

      def initialize(argv)
        @pods_folder = Dir.open('Pods/')
        @integer_lock = File.open('Integer.lock')
        super
      end

      def validate!
        super
        help! "There is no Pods/ folder or Integer.lock available" unless @pods_folder and @integer_lock
      end

      def run
        # Integer goes here
      end
    end
  end
end
