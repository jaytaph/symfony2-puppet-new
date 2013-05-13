Symfony2 Vagrant / Puppet
=========================

This system is a plain symfony2 framework that runs out of the box on a vagrant machine. It uses puppet scripts to
 setup the base system (ubuntu precice64) so you the projects can run straight away.

Usage:
    - git clone https://github.com/jaytaph/symfony2-puppet-new.git
    - vagrant up
    - Add inside your hostfile: 192.168.33.10  www.symfony2-project.dev
    - Browse to: http://www.symfony2-project.dev/app_dev.php
