Facter.add("yum_updates_available_list") do
	setcode do
		if File.exist? '/tmp/yumcheckupdateslist'
			Facter::Core::Execution.exec('cat /tmp/yumcheckupdateslist')
        	end
	end
end

Facter.add("yum_updates_available") do
	setcode do
		if File.exist? '/tmp/yumcheckupdates'
			Facter::Core::Execution.exec('cat /tmp/yumcheckupdates')
        	end
	end
end

Facter.add("yum_updates_available_security_list") do
	setcode do
		if File.exist? '/tmp/yumcheckupdateslistsecurity'
			Facter::Core::Execution.exec('cat /tmp/yumcheckupdateslistsecurity')
        	end
	end
end

Facter.add("yum_updates_available_security") do
	setcode do
		if File.exist? '/tmp/yumcheckupdatessecurity'
			Facter::Core::Execution.exec('cat /tmp/yumcheckupdatessecurity')
        	end
	end
end

