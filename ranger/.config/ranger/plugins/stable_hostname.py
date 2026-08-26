"""Use the Mac's stable local name in Ranger's title bar."""

import subprocess
import sys

import ranger.api


_hook_init = ranger.api.hook_init


def hook_init(fm):
    _hook_init(fm)

    if sys.platform != "darwin":
        return

    try:
        local_hostname = subprocess.check_output(
            ["/usr/sbin/scutil", "--get", "LocalHostName"],
            text=True,
            stderr=subprocess.DEVNULL,
        ).strip()
    except (OSError, subprocess.CalledProcessError):
        return

    if "MacBook" in local_hostname:
        fm.hostname = "macbook"
    elif "Mac-Mini" in local_hostname or "Mac-mini" in local_hostname:
        fm.hostname = "mac-mini"
    else:
        fm.hostname = local_hostname.lower()


ranger.api.hook_init = hook_init
