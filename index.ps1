Add-Type -AssemblyName System.Windows.Forms
$form = New-Object System.Windows.Forms.Form
$form.Name = "fm1"
$form.Size = [System.Drawing.Size]::new(300,340)
$form.TopMost = $true
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen

$avatar = New-Object System.Windows.Forms.PictureBox
$avatar.Size = [System.Drawing.Size]::new(100,100)
$avatar.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::StretchImage
$avatar.BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D
$avatar.Location = [System.Drawing.Point]::new(100,0)

$name = New-Object System.Windows.Forms.Label
$name.Location = [System.Drawing.Point]::new(0,100)
$name.AutoSize = $true

$email = New-Object System.Windows.Forms.Label
$email.Location = [System.Drawing.Point]::new(0,120)
$email.AutoSize = $true

$bio = New-Object System.Windows.Forms.Label
$bio.Location = [System.Drawing.Point]::new(0,140)
$bio.AutoSize = $true

$location = New-Object System.Windows.Forms.Label
$location.Location = [System.Drawing.Point]::new(0,160)
$location.AutoSize = $true

$company = New-Object System.Windows.Forms.Label
$company.Location = [System.Drawing.Point]::new(0,180)
$company.AutoSize = $true


$twitter_username = New-Object System.Windows.Forms.Label
$twitter_username.Location = [System.Drawing.Point]::new(0,200)
$twitter_username.AutoSize = $true

$public_repos = New-Object System.Windows.Forms.Label
$public_repos.Location = [System.Drawing.Point]::new(0,220)
$public_repos.AutoSize = $true

$public_gists = New-Object System.Windows.Forms.Label
$public_gists.Location = [System.Drawing.Point]::new(0,240)
$public_gists.AutoSize = $true

$followers = New-Object System.Windows.Forms.Label
$followers.Location = [System.Drawing.Point]::new(0,260)
$followers.AutoSize = $true

$following  = New-Object System.Windows.Forms.Label
$following.Location = [System.Drawing.Point]::new(0,280)
$following.AutoSize = $true

Write-Host "Digite o seu usuário no GitHub"
$user= Read-Host 
if($user)
{
$params = @{
    URI="https://api.github.com/users/$user"
    Method="GET"
}
try{
$res = Invoke-RestMethod @params

$avatar.Load($res.avatar_url)

$name.Text = "Nome: "+$res.name

$email.Text = "E-mail: "+$res.email

$bio.Text = "Bio: "+$res.bio

$location.Text = "Localização: "+$res.location

$company.Text = "Empresa: "+$res.company

$twitter_username.Text = "Twitter: "+$res.twitter_name

$public_repos.Text = "Repo. Públicos: "+$res.public_repos

$public_gists.Text = "Contribuições: "+$res.public_gists

$followers.Text = "Seguidores: "+$res.followers

$following.Text = "Seguindo: "+$res.following


$form.Controls.Add($avatar)

$form.Controls.Add($name)

$form.Controls.Add($email)

$form.Controls.Add($bio)

$form.Controls.Add($location)

$form.Controls.Add($company)

$form.Controls.Add($twitter_username)

$form.Controls.Add($public_repos)

$form.Controls.Add($public_gists)

$form.Controls.Add($followers)

$form.Controls.Add($following)

$form.ShowDialog()
}
catch{
    [System.Windows.Forms.MessageBox]::Show("Usuário não encontrado.")
}
}
if(!$user){
    [System.Windows.Forms.MessageBox]::Show("Digite o nome do usuário!")
    return
}