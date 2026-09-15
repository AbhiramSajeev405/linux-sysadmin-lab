# Phase 1 - Users, Groups and Permissions

## Objective

The objective of this phase was to practice Linux user and group administration, file ownership, permissions, and controlled access to shared directories.

## User and Group Administration

Two groups were created to represent different organizational roles:

- `developers`
- `operations`

Two user accounts were configured:

- `devuser1` - member of the `developers` group
- `opsuser1` - member of the `operations` group

Commands such as `id` and `getent` were used to inspect user IDs, group IDs, group memberships, and account information.

Linux account information stored in `/etc/passwd` and protected password information associated with `/etc/shadow` were also examined.

## Shared Directory and Ownership

A shared application directory was created at:

`/srv/company-app`

The directory ownership was configured as:

`root:developers`

This allowed the `developers` group to be used for controlling access to the shared application directory.

## Permission Configuration

The shared directory permissions were configured as:

`770`

This provided:

- Full read, write, and execute permissions to the owner.
- Full read, write, and execute permissions to the `developers` group.
- No permissions for other users.

Access was tested using different user accounts. `devuser1`, as a member of the `developers` group, was able to access and work inside the shared directory, while `opsuser1` was denied access.

## Setgid for Shared Group Ownership

The setgid permission was enabled on the shared directory using:

`chmod g+s /srv/company-app`

With setgid enabled on a directory, newly created files and directories inherit the directory's group ownership instead of using only the creator's default primary group.

This helps maintain consistent group ownership in directories shared by multiple users.

## Verification

The configuration was verified by:

- Checking user and group information with `id` and `getent`.
- Inspecting directory ownership and permissions.
- Testing access with an authorized user.
- Testing access with an unauthorized user.
- Creating files and confirming group inheritance after enabling setgid.

## Outcome

This phase demonstrated Linux user and group administration, ownership, permissions, access control, and shared-directory management using setgid.
