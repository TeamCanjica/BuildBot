BuildBot
========

First starting on Jenkins

Execute shell :

      git clone https://github.com/TeamCanjica/Jenkins_BuildBot.git
      
After that 

Execute shell:

      export DH_USER=****
      export DH_PASSWORD=****
      
      $WORKSPACE/Jenkins_BuildBot/job.sh
      
Parameters:

      Choice - DEVICE
      Choice - REPO_BRANCH
      Bool   - CLEAN
      Bool   - DBG
      Bool   - UPLOAD*
      Bool   - PUBLIC*
      Bool   - UL_ONLY*
      Bool   - SYNC*
      Bool   - KERNEL_ONLY*
      Bool   - SINGLE_PACKAGE*
      Text   - DESC *
      Text   - PACKAGE_NAME*

*If not selected, default values are used
