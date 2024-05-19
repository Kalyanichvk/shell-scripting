#Check if the user already exists and create if not exists.
#Generate Random Password and assign to the user.
#Make sure user has sudo permissions.
#Expire the password forcing the user to reset it.

#!/bin/bash
#USERNAME=$1
if [ $# -gt 0 ]; then
    for USERNAME in $@; do
        EXISTING_USER=$(cat /etc/passwd | grep -i -w ${USERNAME} | cut -d ':' -f 1)
        if [ "${USERNAME}" = "${EXISTING_USER}" ]; then
            echo "The User ${USERNAME} Already Exists. Try A Diffrent Username."
        else
            echo "Lets Create User ${USERNAME}."
            sudo useradd -m $USERNAME --shell /bin/bash -d /home/${USERNAME}
            sudo usermod -aG sudo ${USERNAME}
            echo '${USERNAME} ALL=(ALL) NOPASSWD: ALL' >>/etc/sudoers
            SPEC=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
            PASSWORD="India@${RANDOM}${SPEC}"
            echo "${USERNAME}:${PASSWORD}" | sudo chpasswd
            passwd -e ${USERNAME}
            echo "The Temporary Credentails are ${USERNAME} and ${PASSWORD}"
        fi
    done
else
    echo "You Have Given $# Arguments. Please Provide Atleast One Arg."
fi
