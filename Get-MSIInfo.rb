require 'win32ole'

# See:
# http://msdn.microsoft.com/en-us/library/windows/desktop/aa369434(v=vs.85).aspx

installer = WIN32OLE.new('WindowsInstaller.Installer')
db = installer.OpenDatabase(ARGV[0], 0) # open R/O

puts "PackageName: #{db.SummaryInformation.Property(2)}" 
puts "PackageCode: #{db.SummaryInformation.Property(9)}" 
