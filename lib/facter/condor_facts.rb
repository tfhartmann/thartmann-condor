require 'rubygems'
require 'crack'

#hostname = Facter.value(:hostname)
hostname = 'eng095'
raw_input = `/usr/bin/condor_status -xml -attributes Name,State,Activity #{hostname}`

xml_data = Crack::XML.parse(raw_input)
if xml_data['classads'] != nil 
  my_host = xml_data['classads']['c'][0]['a']


  my_host.each do |item|
    if item['n'] == 'Name'
      Facter.add(:condor_name) do
        setcode do
          condor_name = item['s']
        end
      end
    end
    if item['n'] == 'State'
      Facter.add(:condor_state) do
        setcode do
          condor_state = item['s']
        end
      end
    end
    if item['n'] == 'Activity'
      Facter.add(:condor_activity) do
        setcode do
          condor_activity = item['s']
        end
      end
    end
  end
end
