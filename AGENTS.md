# Repository Guidelines

## Project Structure & Module Organization

This repository is an ArduPilot-based firmware tree. Vehicle applications live in `ArduCopter/`, `ArduPlane/`, `Rover/`, `ArduSub/`, `Blimp/`, and `AntennaTracker/`. Shared flight-stack code is under `libraries/`, board hardware definitions are in `libraries/AP_HAL_ChibiOS/hwdef/`, and build/autotest utilities are in `Tools/`. Third-party dependencies are tracked as git submodules in `modules/`. Unit-test support is under `tests/`; generated artifacts go to `build/<board>/bin/` and should not be hand-edited.

## Build, Test, and Development Commands

Run Waf from the repository root.

```sh
git submodule update --init --recursive
./waf list_boards
./waf configure --board mini-pix
./waf plane
./waf copter
./waf --targets bin/arduplane
./waf --targets bin/arduplane --upload --upload-port COM7
```

`configure` selects the target board; rerun it when changing boards or build options. Use `plane`, `copter`, `rover`, `sub`, or `antennatracker` to build complete vehicle groups. Use `--targets` for a single binary or test. On Cygwin, this tree has been configured for `mini-pix`; adjust `COM7` to the connected flight controller port.

## Coding Style & Naming Conventions

Follow the existing ArduPilot style in nearby files. `.editorconfig` specifies spaces, 4-space indentation, LF line endings, UTF-8, and no automatic trailing-whitespace cleanup churn; Makefiles use tabs. C++ classes and libraries follow existing `AP_*` naming patterns, vehicle code stays within its vehicle directory, and board-specific changes belong in the matching `hwdef` directory. Python tooling should pass the repository `.flake8` rules, including a 127-character maximum line length.

## Testing Guidelines

For unit tests, configure a host/SITL-style board when appropriate, then run:

```sh
./waf configure --board sitl
./waf --targets tests/test_math
./waf check
./waf check-all
```

Use `Tools/autotest/autotest.py` for vehicle-level simulation tests when behavior changes affect flight modes, MAVLink, failsafes, or parameters. Add focused tests for new shared library behavior.

## Commit & Pull Request Guidelines

Recent history uses concise subjects such as `Plane: prepare for 4.2.2 stable` and `Tools/scripts: suppress uploader port-scan errors on Cygwin`. Prefer `Subsystem: imperative summary`, keep subjects short, and group unrelated changes into separate commits. Pull requests should state the affected vehicle/board, summarize behavior changes, list build/test commands run, link related issues, and include logs or screenshots for UI, tooling, or upload-flow changes.
