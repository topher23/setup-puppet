
class helloworld{
        file { '/tmp/test':
                content => "test to see if puppet is running."
             }
       package {["git", "openjdk-6-jdk"]:
                ensure => "installed"
                }

        schedule {"first":
                range => "15:00 - 15:40",
                repeat=> 2
                 }
        schedule {"second":
                range => "15:40 - 15:45",
                repeat=> 2
                 }
        schedule {"third":
                range => "15:45 - 17:00",
                repeat=> 2
                 }

        if $hostname == "coors"
        {
                package {"ensure tomcat6 coors":
                        name => 'tomcat6',
                        schedule => "first",
                        ensure => "installed"
                     }
                file {"install sample app for tomcat6":
                        path => "/var/lib/tomcat6/webapps/sample.war",
                        schedule => "first",
                        source=> "puppet:///modules/helloworld/sample.war"
                      }
                package {["tomcat6, tomcat6-common", "libtomcat6-java"]:
                                schedule => "third",
                                ensure => "absent"
                        }
                package {"ensure tomcat7 coors":
                        name => 'tomcat7',
                                schedule => "third",
                                ensure => "installed"
                        }
                file    {"sample for tomcat7":
                        path => "/var/lib/tomcat7/webapps/sample.war",
                                schedule => "third",
                                source=> "puppet:///modules/helloworld/sample.war"
                     }

        }
        elsif $hostname == "becks"
        {
                package {"ensure tomcat7 becks":
                        name => 'tomcat7',
                        schedule => "second",
                        ensure => "installed"
                     }
                file    {"sample for tomcat7 becks":
                        path => "/var/lib/tomcat7/webapps/sample.war",
                                schedule => "second",
                                source=> "puppet:///modules/helloworld/sample.war"
                        }
        }
}
