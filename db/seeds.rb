#name, city, url, contact_info
organization_list = {
  "CAMBA" => {
    :city => "Brooklyn",
    :url => "https://www.camba.org",
    :contact_info => "1720 Church Ave., 2nd Floor, Brooklyn, NY 11226, tel: 718-282-2500"
  },
  "Refugee Resettlement Program/Catholic Charities, Diocese of Brooklyn" => {
    :city => "Brooklyn",
    :url => "www.ccbq.org",
    :contact_info => "191 Joralemon Street, 4th Floor, Brooklyn, NY 11201, tel: 718-722-6009"
  },
  "InterfaithWorks of Central New Tork" => {
    :city => "Syracuse",
    :url => "www.interfaithworksny.org",
    :contact_info => "3049 East Genesee Street, Syracuse, NY 13224, tel: 315-474-1261"
  },
  "Northside CYO/Catholic Charities" => {
    :city => "Syracuse",
    :url => "www.ccoc.us/services/refugee-services/refugee-resettlement",
    :contact_info => "527 N. Salina Street, Syracuse, NY 13208, tel: 315-474-7428"
  }
}

organization_list.each do |name, organization_hash|
  o = Organization.new
  o.name = name
  organization_hash.each do |attribute, value|
      o[attribute] = value
  end
  o.save
end
