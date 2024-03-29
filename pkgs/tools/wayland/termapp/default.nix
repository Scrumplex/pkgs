# Copyright (C) 2021,2023 Sefa Eyeoglu <contact@scrumplex.net>
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
{
  lib,
  writeShellApplication,
  coreutils,
  kitty,
  run-or-raise,
}:
writeShellApplication {
  name = "termapp";

  runtimeInputs = [coreutils kitty run-or-raise];

  text = ''
    if [ $# -eq 0 ]; then
      exit 1
    fi

    appid="popup_$(basename "$1")"

    exec run-or-raise "$appid" kitty "--class=$appid" "$@"
  '';

  meta = with lib; {
    platforms = platforms.linux;
  };
}
