BuildBot
========

---------------------------------------------------------------
First starting on Jenkins

Execute shell :

      git clone https://github.com/TeamCanjica/BuildBot.git
      
--------------------------------------------------------------

Execute shell:

      export DH_USER=****
      export DH_PASSWORD=****
      
      $WORKSPACE/BuildBot/job.sh
      
--------------------------------------------------------------
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
      Text   - DESC *
      Text   - PACKAGE_NAME*

*If not selected, default values are used
--------------------------------------------------------------
