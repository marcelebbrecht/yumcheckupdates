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

Facter.add("yum_hold_available_list") do
	setcode do
		if File.exist? '/tmp/yumcheckholdlist'
			Facter::Core::Execution.exec('cat /tmp/yumcheckholdlist')
        	end
	end
end

Facter.add("yum_hold_available") do
	setcode do
		if File.exist? '/tmp/yumcheckhold'
			Facter::Core::Execution.exec('cat /tmp/yumcheckhold')
        	end
	end
end

Facter.add("yum_needs_reboot") do
	setcode do
		if File.exist? '/tmp/yumneedsreboot'
			Facter::Core::Execution.exec('cat /tmp/yumneedsreboot')
        	end
	end
end

