:Windows batch file to change attributes on AWS keypair.pem file so it 
:  can be used to ssh from windows to EC2. 
:  You need to change the file name listed here as an example 
:
icacls terraform-key-pair.476d.pem /reset
icacls terraform-key-pair.476d.pem /grant:r "$($env:Admin):(r)"
icacls terraform-key-pair.476d.pem /grant:r %username%:(R)
icacls.exe your_key_name.pem /inheritance:r
