Facter.add(:updates_available_list) do
    setcode do
	    Facter::Core::Execution.exec('cat /tmp/yumcheckupdateslist')
    end
end

Facter.add(:updates_available) do
    setcode do
	    Facter::Core::Execution.exec('cat /tmp/yumcheckupdates')
    end
end

Facter.add(:updates_available_security_list) do
    setcode do
	    Facter::Core::Execution.exec('cat /tmp/yumcheckupdateslistsecurity')
    end
end

Facter.add(:updates_available_security) do
    setcode do
	    Facter::Core::Execution.exec('cat /tmp/yumcheckupdatessecurity')
    end
end

