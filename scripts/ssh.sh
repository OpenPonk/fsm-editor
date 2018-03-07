openssl aes-256-cbc -K $encrypted_426771947c86_key -iv $encrypted_426771947c86_iv -in .ssh/id_fsm_travis.enc -out .ssh/id_fsm_travis -d
chmod 0400 .ssh/id_fsm_travis
eval $(ssh-agent -s)
ssh-add .ssh/id_fsm_travis