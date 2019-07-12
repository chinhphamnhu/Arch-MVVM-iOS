# MVVM Architecture for iOS

**Swift script for renaming Xcode project**

It should be executed from inside root of Xcode project directory and called with two string parameters: 
**$OLD_PROJECT_NAME** & **$NEW_PROJECT_NAME**

Script goes through all the files and directories recursively, including Xcode project or workspace file and replaces all occurrences of **$OLD_PROJECT_NAME** string with **$NEW_PROJECT_NAME** string (both in each file's name and content).

## Usage

```bash
# download script and make it executable
$ curl https://raw.githubusercontent.com/chinhphamnhu/xcode-project-renamer/master/Sources/main.swift -o rename.swift && chmod +x rename.swift

# run script
$ ./rename.swift "$OLD_PROJECT_NAME" "$NEW_PROJECT_NAME"

# remove script
$ rm rename.swift
```

## Installation

### Install Homebrew

- [Homebrew](http://brew.sh) The missing package manager for macOS. This is a [listing of all packages](https://formulae.brew.sh/formula/) available via the Homebrew package manager for macOS.

```bash
$ sudo chown -R $(whoami):admin '/usr/local'
$ /usr/bin/ruby -e "$(curl -fsSL 'https://raw.githubusercontent.com/Homebrew/install/master/install')"
```

- Grant permission to Homebrew cache folder

```bash
$ sudo chown -R $(whoami):admin '/Library/Caches/Homebrew'
```

### Install rbenv

Use [rbenv](https://github.com/rbenv/rbenv) to pick a Ruby version for your application and guarantee that your development environment matches production.

```bash
$ brew install rbenv
```

Add this line to your shell profile, such as `~/.bashrc`, or `~/.bash_profile`.

```bash
eval "$(rbenv init -)"
```

You must start new shell after this step.

### Install Ruby

Run this command to install exactly Ruby version which is used in this project.

  ```
  rbenv install
  ```

##

### Install Bundler

* [Bundler](https://bundler.io/) provides a consistent environment for _Ruby_ projects by tracking and installing the exact gems and versions that are needed.

  ```bash
  $ gem install bundler
  ```

##

### Install needed CLIs

Run this command to install needed CLIs, such as `pod`, `fastlane`..

  ```bash
  $ bundle install
  ```

##

### Install project's dependencies

- [CocoaPods](http://cocoapods.org) is a dependency manager for _Cocoa_ projects.
- Run the following command to install project's dependencies:

  ```bash
  $ bundle exec pod install
  ```

##

### Deployment

- Deploy to Fabric for QC

  ```bash
  $ bundle exec fastlane release
  ```

  > If there are some problems occur while uploading the build to Crashlytics Beta. Just try the command below to upload again.
  >
  > ```bash
  > $ bundle exec fastlane upload
  > ```

- Build for UAT

  ```bash
  $ bundle exec fastlane releaseUAT
  ```

- Build for Production

  ```bash
  $ bundle exec fastlane releasePROD
  ```
