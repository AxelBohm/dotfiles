#! /usr/bin/env python2
from subprocess import check_output


def get_pass(account):
    return check_output("pass Email/" + account, shell=True).splitlines()[0]

def get_otp():
    return check_output("pass show Email/yahoo.com | grep one-time-yahoo | awk '{print $2}'", shell=True).splitlines()[0]
