
config router aspath-list
    edit "empty-path"
        config rule
            edit 1
                set action permit
                set regexp "^$"
            next
        end
    next
end

config router route-map
    edit "non-transit"
        config rule
            edit 1
                set match-as-path "empty-path"
            next
        end
    next
end

config router bgp
    set as 65551
    set router-id 10.10.180.254
    set keepalive-timer 45
    set holdtime-timer 120
    set bestpath-med-missing-as-worst enable
    set network-import-check disable
    set graceful-restart enable
    set graceful-stalepath-time 180
    set graceful-update-delay 180
    config neighbor
        edit "172.16.204.125"
            set activate6 disable
            set remote-as 64496
            set route-map-out "non-transit"
            set send-community6 disable
            set keep-alive-timer 45
            set holdtime-timer 120
            set connect-timer 60
            set weight 100
        next
        edit "172.16.6.225"
            set activate6 disable
            set remote-as 64497
            set route-map-out "non-transit"
            set send-community6 disable
            set keep-alive-timer 45
            set holdtime-timer 120
            set connect-timer 60
            set weight 200
        next
        edit "2001:db8:1:101::10a"
            set activate disable
            set remote-as 64496
            set route-map-out6 "non-transit"
            set send-community disable
            set keep-alive-timer 45
            set holdtime-timer 120
            set connect-timer 60
            set weight 100
        next
        edit "2001:db8:2:101::1a"
            set activate disable
            set remote-as 64497
            set route-map-out6 "non-transit"
            set send-community disable
            set keep-alive-timer 45
            set holdtime-timer 120
            set connect-timer 60
            set weight 200
        next
    end
    config network
        edit 1
            set prefix 10.10.180.0 255.255.252.0
        next
    end
    config network6
        edit 1
            set prefix6 2001:db8:face::/48
        next
    end
    config redistribute "connected"
    end
    config redistribute "rip"
    end
    config redistribute "ospf"
    end
    config redistribute "static"
    end
    config redistribute "isis"
    end
    config redistribute6 "connected"
    end
    config redistribute6 "rip"
    end
    config redistribute6 "ospf"
    end
    config redistribute6 "static"
    end
    config redistribute6 "isis"
    end
end
