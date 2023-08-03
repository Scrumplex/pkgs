#!/bin/bash
# Copyright (C) 2020-2021 Bob Hepple <bob.hepple@gmail.com>
# Copyright (C) 2021 Sefa Eyeoglu <contact@scrumplex.net>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

class="$1"
runstring="$2"

[[ -z "$class" ]] && exit 1
[[ -z "$runstring" ]] && exit 1

swaymsg "[app_id=$class] focus" &>/dev/null || {
  # could be Xwayland app:
  swaymsg "[class=$class] focus" &>/dev/null
} || exec $runstring

exit 0
