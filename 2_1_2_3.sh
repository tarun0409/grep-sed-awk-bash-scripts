ifconfig -a | sed -nr '/([0-9a-fA-F][0-9a-fA-F][:\-]){5}([0-9a-fA-F][0-9a-fA-F])/p'
