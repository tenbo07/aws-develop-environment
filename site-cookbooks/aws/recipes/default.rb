#
# Cookbook Name:: nri_shared
# Recipe:: default
#
# Copyright 2014, HiganWorks LLC
#
# All rights reserved - Do Not Redistribute
#


include_recipe "#{cookbook_name}::awscli"
include_recipe "#{cookbook_name}::rvm_install"
include_recipe "#{cookbook_name}::gem_install"
