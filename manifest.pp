class helloworld {
        file { '/tmp/test':
                content => "test to see if puppet is running."
             }
        package {"git":
                ensure => "installed"
                }
        package {"openjdk-6-jdk":
                ensure => "installed"
                }

        schedule {"first":
                range => "12:00 - 12:10"
                repeat=> 2
                 }
        schedule {"second":
                range => "12:10 - 12:20"
                repeat=> 2
                 }
        schedule {"third":
                range => "12:20 - 13:00"
                repeat=> 2
                 }



        if $hostname == "coors"
        {
                package {"tomcat6":
                        schedule => "first",
                        ensure => "installed"
                        }
                file    {"/var/lib/tomcat6/webapps/sample.war":
                        schedule => "first"
                        source=> "puppet:///modules/helloworld/sample.war"
                         }
                package {"tomcat6":
                        schedule => "third",
                        ensure => "absent",
                package {"tomcat7":
                        schedule => "third",
                        ensure => "installed"
                        }
                file    {"/var/lib/tomcat7/webapps/sample.war":
                        schedule => "third",
                        source=> "puppet:///modules/helloworld/sample.war"

        }
        elseif $hostname == "becks"
        {
                package {"tomcat6":
                        schedule => "first",
                        ensure => "absent"
                        }
                package {"tomcat7":
                        schedule => "second",
                        ensure => "installed"
                        }
                file    {"/var/lib/tomcat7/webapps/sample.war":
                        schedule => "second",
                        source=> "puppet:///modules/helloworld/sample.war"
                         }

        }

}
