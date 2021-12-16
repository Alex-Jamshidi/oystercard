# This is my station class
class Station
  attr_reader :name, :zone

  def initialize(name)
    fail "Station name does not exist" if !check_zone(name)
    @name = name
    @zone = self.check_zone(@name)
  end
  
  def check_zone(name)
    stations = {
      'Abbey Road' => 3,
      'Abbey Wood' => 4,
      'Acton Central' => 2,
      'Acton Main Line' => 3,
      'Acton Town' => 3,
      'Addington Village' => 3,
      'Addiscombe' => 3,
      'Albany Park' => 5,
      'Aldgate' => 1,
      'Aldgate East' => 1,
      'Alexandra Palace' => 3,
      'All Saints' => 2,
      'Alperton' => 4,
      'Ampere Way' => 3,
      'Anerley' => 4,
      'Angel' => 1,
      'Angel Road' => 4,
      'Archway' => 2,
      'Arena' => 3,
      'Arnos Grove' => 4,
      'Arsenal' => 2,
      'Avenue Road' => 3,
      'Baker Street' => 1,
      'Balham' => 3,
      'Bank' => 1,
      'Banstead' => 6,
      'Barbican' => 1,
      'Barking' => 4,
      'Barkingside' => 4,
      'Barnehurst' => 6,
      'Barnes' => 3,
      'Barnes Bridge' => 3,
      'Barons Court' => 2,
      'Battersea Park' => 2,
      'Battersea Power Station' => 1,
      'Bayswater' => 1,
      'Beckenham Hill' => 4,
      'Beckenham Junction' => 4,
      'Beckenham Road' => 3,
      'Beckton' => 3,
      'Beckton Park' => 3,
      'Becontree' => 5,
      'Beddington Lane' => 3,
      'Belgrave Walk' => 3,
      'Bellingham' => 3,
      'Belmont' => 5,
      'Belsize Park' => 2,
      'Belvedere' => 5,
      'Bermondsey' => 2,
      'Berrylands' => 5,
      'Bethnal Green' => 2,
      'Bethnal Green Rail' => 2,
      'Bexley' => 6,
      'Bexleyheath' => 5,
      'Bickley' => 5,
      'Birkbeck' => 4,
      'Blackfriars' => 1,
      'Blackheath' => 3,
      'Blackhorse Lane' => 3,
      'Blackhorse Road' => 3,
      'Blackwall' => 2,
      'Bond Street' => 1,
      'Borough' => 1,
      'Boston Manor' => 4,
      'Bounds Green' => 3,
      'Bow Church' => 2,
      'Bow Road' => 2,
      'Bowes Park' => 3,
      'Brent Cross' => 3,
      'Brentford' => 4,
      'Brimsdown' => 5,
      'Brixton' => 2,
      'Brockley' => 2,
      'Bromley North' => 4,
      'Bromley South' => 5,
      'Bromley-by-Bow' => 2,
      'Brondesbury' => 2,
      'Brondesbury Park' => 2,
      'Bruce Grove' => 3,
      'Buckhurst Hill' => 5,
      'Burnt Oak' => 4,
      'Bush Hill Park' => 5,
      'Caledonian Road' => 2,
      'Caledonian Road and Barnsbury' => 2,
      'Cambridge Heath' => 2,
      'Camden Road' => 2,
      'Camden Town' => 2,
      'Canada Water' => 2,
      'Canary Wharf' => 2,
      'Canning Town' => 3,
      'Cannon Street' => 1,
      'Canonbury' => 2,
      'Canons Park' => 5,
      'Carshalton' => 5,
      'Carshalton Beeches' => 5,
      'Castle Bar Park' => 4,
      'Caterham' => 6,
      'Catford' => 3,
      'Catford Bridge' => 3,
      'Centrale' => 3,
      'Chadwell Heath' => 5,
      'Chalk Farm' => 2,
      'Chancery Lane' => 1,
      'Charing Cross' => 1,
      'Charlton' => 3,
      'Cheam' => 5,
      'Chelsfield' => 6,
      'Chessington North' => 6,
      'Chessington South' => 6,
      'Chigwell' => 4,
      'Chingford' => 5,
      'Chipstead' => 6,
      'Chislehurst' => 5,
      'Chiswick' => 3,
      'Chiswick Park' => 3,
      'Church Street' => 3,
      'City Thameslink' => 1,
      'Clapham Common' => 2,
      'Clapham High Street' => 2,
      'Clapham Junction' => 2,
      'Clapham North' => 2,
      'Clapham South' => 2,
      'Clapton' => 2,
      'Clock House' => 4,
      'Cockfosters' => 5,
      'Colindale' => 4,
      'Colliers Wood' => 3,
      'Coombe Lane' => 3,
      'Coulsdon South' => 6,
      'Coulsdon Town' => 6,
      'Covent Garden' => 1,
      'Crayford' => 6,
      'Crews Hill' => 6,
      'Cricklewood' => 3,
      'Crofton Park' => 3,
      'Crossharbour and London Arena' => 2,
      'Crouch Hill' => 3,
      'Crystal Palace' => 3,
      'Custom House' => 3,
      'Cutty Sark for Maritime Greenwich' => 2,
      'Cyprus' => 3,
      'Dagenham Dock' => 5,
      'Dagenham East' => 5,
      'Dagenham Heathway' => 5,
      'Dalston Junction' => 2,
      'Dalston Kingsland' => 2,
      'Debden' => 6,
      'Denmark Hill' => 2,
      'Deptford' => 2,
      'Deptford Bridge' => 2,
      'Devons Road' => 2,
      'Dollis Hill' => 3,
      'Drayton Green' => 4,
      'Drayton Park' => 2,
      'Dundonald Road' => 3,
      'Ealing Broadway' => 3,
      'Ealing Common' => 3,
      'Earls Court' => 1,
      'Earlsfield' => 3,
      'East Acton' => 2,
      'East Croydon' => 5,
      'East Dulwich' => 2,
      'East Finchley' => 3,
      'East Ham' => 3,
      'East India' => 2,
      'East Putney' => 2,
      'Eastcote' => 5,
      'Eden Park' => 5,
      'Edgware' => 5,
      'Edgware Road (Bakerloo)' => 1,
      'Edgware Road (Circle/District/Hammersmith and City)' => 1,
      'Edmonton Green' => 4,
      'Elephant and Castle' => 1,
      'Elm Park' => 6,
      'Elmers End' => 4,
      'Elmstead Woods' => 4,
      'Elstree and Borehamwood' => 6,
      'Eltham' => 4,
      'Elverson Road' => 2,
      'Embankment' => 1,
      'Emerson Park' => 6,
      'Enfield Chase' => 5,
      'Enfield Lock' => 6,
      'Enfield Town' => 5,
      'Epping' => 6,
      'Epsom Downs' => 6,
      'Erith' => 6,
      'Essex Road' => 2,
      'Euston' => 1,
      'Euston Square' => 1,
      'Ewell East' => 6,
      'Ewell West' => 6,
      'Fairlop' => 4,
      'Falconwood' => 4,
      'Farringdon' => 1,
      'Feltham' => 6,
      'Fenchurch Street' => 1,
      'Fieldway' => 3,
      'Finchley Central' => 4,
      'Finchley Road' => 2,
      'Finchley Road and Frognal' => 2,
      'Finsbury Park' => 2,
      'Forest Gate' => 3,
      'Forest Hill' => 3,
      'Fulham Broadway' => 2,
      'Fulwell' => 6,
      'Gallions Reach' => 3,
      'Gants Hill' => 4,
      'George Street' => 3,
      'Gidea Park' => 6,
      'Gipsy Hill' => 3,
      'Gloucester Road' => 1,
      'Golders Green' => 3,
      'Goldhawk Road' => 2,
      'Goodge Street' => 1,
      'Goodmayes' => 4,
      'Gordon Hill' => 5,
      'Gospel Oak' => 2,
      'Grange Hill' => 4,
      'Grange Park' => 5,
      'Gravel Hill' => 3,
      'Great Portland Street' => 1,
      'Green Park' => 1,
      'Greenford' => 4,
      'Greenwich' => 2,
      'Grove Park' => 4,
      'Gunnersbury' => 3,
      'Hackbridge' => 4,
      'Hackney Central' => 2,
      'Hackney Downs' => 2,
      'Hackney Wick' => 2,
      'Hadley Wood' => 6,
      'Haggerston' => 2,
      'Hainault' => 4,
      'Hammersmith (District)' => 2,
      'Hammersmith (Met.)' => 2,
      'Hampstead' => 2,
      'Hampstead Heath' => 3,
      'Hampton' => 6,
      'Hampton Court' => 6,
      'Hampton Wick' => 6,
      'Hanger Lane' => 3,
      'Hanwell' => 4,
      'Harlesden' => 3,
      'Harold Wood' => 6,
      'Harringay' => 3,
      'Harringay Green Lanes' => 3,
      'Harrington Road' => 3,
      'Harrow and Wealdstone' => 5,
      'Harrow-on-the-Hill' => 5,
      'Hatch End' => 6,
      'Hatton Cross' => 5,
      'Haydons Road' => 3,
      'Hayes' => 5,
      'Hayes and Harlington' => 5,
      'Headstone Lane' => 5,
      'Heathrow Terminal 4' => 6,
      'Heathrow Terminal 5' => 6,
      'Heathrow Terminals 1 2 3' => 6,
      'Hendon' => 3,
      'Hendon Central' => 3,
      'Herne Hill' => 2,
      'Heron Quays' => 2,
      'High Barnet' => 5,
      'High Street Kensington' => 1,
      'Highams Park' => 4,
      'Highbury and Islington' => 2,
      'Highgate' => 3,
      'Hillingdon' => 6,
      'Hither Green' => 3,
      'Holborn' => 1,
      'Holland Park' => 2,
      'Holloway Road' => 2,
      'Homerton' => 2,
      'Honor Oak Park' => 3,
      'Hornchurch' => 6,
      'Hornsey' => 3,
      'Hounslow' => 5,
      'Hounslow Central' => 4,
      'Hounslow East' => 4,
      'Hounslow West' => 5,
      'Hoxton' => 1,
      'Hyde Park Corner' => 1,
      'Ickenham' => 6,
      'Ilford' => 4,
      'Imperial Wharf' => 2,
      'Island Gardens' => 2,
      'Isleworth' => 4,
      'Kenley' => 6,
      'Kennington' => 2,
      'Kensal Green' => 2,
      'Kensal Rise' => 2,
      'Kensington (Olympia)' => 2,
      'Kent House' => 4,
      'Kentish Town' => 2,
      'Kentish Town West' => 2,
      'Kenton' => 4,
      'Kew Bridge' => 3,
      'Kew Gardens' => 3,
      'Kidbrooke' => 3,
      'Kilburn' => 2,
      'Kilburn High Road' => 2,
      'Kilburn Park' => 2,
      'King George V' => 3,
      'King Henry_s Drive' => 3,
      'King_s Cross' => 1,
      'Kings Cross St. Pancras' => 1,
      'Kingsbury' => 4,
      'Kingston' => 6,
      'Kingswood' => 6,
      'Knightsbridge' => 1,
      'Knockholt' => 6,
      'Ladbroke Grove' => 2,
      'Ladywell' => 3,
      'Lambeth North' => 1,
      'Lancaster Gate' => 1,
      'Langdon Park' => 2,
      'Latimer Road' => 2,
      'Lea Bridge' => 3,
      'Lebanon Road' => 3,
      'Lee' => 3,
      'Leicester Square' => 1,
      'Lewisham' => 2,
      'Leyton' => 3,
      'Leyton Midland Road' => 3,
      'Leytonstone' => 3,
      'Leytonstone High Road' => 3,
      'Limehouse' => 2,
      'Liverpool Street' => 1,
      'Lloyd Park' => 3,
      'London Bridge' => 1,
      'London City Airport' => 3,
      'London Fields' => 2,
      'Loughborough Junction' => 2,
      'Loughton' => 6,
      'Lower Sydenham' => 4,
      'Maida Vale' => 2,
      'Malden Manor' => 4,
      'Manor House' => 2,
      'Manor Park' => 3,
      'Mansion House' => 1,
      'Marble Arch' => 1,
      'Maryland' => 3,
      'Marylebone' => 1,
      'Maze Hill' => 3,
      'Meridian Water' => 4,
      'Merton Park' => 3,
      'Mile End' => 2,
      'Mill Hill Broadway' => 4,
      'Mill Hill East' => 4,
      'Mitcham' => 3,
      'Mitcham Eastfields' => 3,
      'Mitcham Junction' => 4,
      'Monument' => 1,
      'Moor Park' => 6,
      'Moorgate' => 1,
      'Morden' => 4,
      'Morden Road' => 3,
      'Morden South' => 4,
      'Mornington Crescent' => 2,
      'Mortlake' => 3,
      'Motspur Park' => 4,
      'Mottingham' => 4,
      'Mudchute' => 2,
      'Neasden' => 3,
      'New Addington' => 3,
      'New Barnet' => 5,
      'New Beckenham' => 4,
      'New Cross' => 2,
      'New Cross Gate' => 2,
      'New Eltham' => 4,
      'New Malden' => 4,
      'New Southgate' => 4,
      'Newbury Park' => 4,
      'Nine Elms' => 1,
      'Norbiton' => 5,
      'Norbury' => 3,
      'North Acton' => 2,
      'North Dulwich' => 2,
      'North Ealing' => 3,
      'North Greenwich' => 2,
      'North Harrow' => 5,
      'North Sheen' => 3,
      'North Wembley' => 4,
      'Northfields' => 3,
      'Northolt' => 5,
      'Northolt Park' => 5,
      'Northumberland Park' => 3,
      'Northwick Park' => 4,
      'Northwood' => 6,
      'Northwood Hills' => 6,
      'Norwood Junction' => 4,
      'Notting Hill Gate' => 1,
      'Nunhead' => 2,
      'Oakleigh Park' => 4,
      'Oakwood' => 5,
      'Old Street' => 1,
      'Orpington' => 6,
      'Osterley' => 4,
      'Oval' => 2,
      'Oxford Circus' => 1,
      'Paddington' => 1,
      'Palmers Green' => 4,
      'Park Royal' => 3,
      'Parsons Green' => 2,
      'Peckham Rye' => 2,
      'Penge East' => 4,
      'Penge West' => 4,
      'Perivale' => 4,
      'Petts Wood' => 5,
      'Phipps Bridge' => 3,
      'Piccadilly Circus' => 1,
      'Pimlico' => 1,
      'Pinner' => 5,
      'Plaistow' => 3,
      'Plumstead' => 4,
      'Ponders End' => 5,
      'Pontoon Dock' => 3,
      'Poplar' => 2,
      'Preston Road' => 4,
      'Prince Regent' => 3,
      'Pudding Mill Lane' => 2,
      'Purley' => 6,
      'Purley Oaks' => 6,
      'Putney' => 2,
      'Putney Bridge' => 2,
      'Queens Park' => 2,
      'Queens Road Peckham' => 2,
      'Queensbury' => 4,
      'Queenstown Road' => 2,
      'Queensway' => 1,
      'Rainham' => 6,
      'Ravensbourne' => 4,
      'Ravenscourt Park' => 2,
      'Rayners Lane' => 5,
      'Raynes Park' => 4,
      'Rectory Road' => 2,
      'Redbridge' => 4,
      'Reedham' => 6,
      'Reeves Corner' => 3,
      'Regents Park' => 1,
      'Richmond' => 4,
      'Riddlesdown' => 6,
      'Roding Valley' => 4,
      'Romford' => 6,
      'Rotherhithe' => 2,
      'Royal Albert' => 3,
      'Royal Oak' => 2,
      'Royal Victoria' => 3,
      'Ruislip' => 6,
      'Ruislip Gardens' => 5,
      'Ruislip Manor' => 6,
      'Russell Square' => 1,
      'Sanderstead' => 6,
      'Sandilands' => 3,
      'Selhurst' => 4,
      'Seven Kings' => 4,
      'Seven Sisters' => 3,
      'Shadwell' => 2,
      'Shepherds Bush' => 2,
      'Shepherds Bush Market' => 2,
      'Shoreditch High Street' => 1,
      'Shortlands' => 4,
      'Sidcup' => 5,
      'Silver Street' => 4,
      'Slade Green' => 6,
      'Sloane Square' => 1,
      'Snaresbrook' => 4,
      'South Acton' => 3,
      'South Bermondsey' => 2,
      'South Croydon' => 5,
      'South Ealing' => 3,
      'South Greenford' => 4,
      'South Hampstead' => 2,
      'South Harrow' => 5,
      'South Kensington' => 1,
      'South Kenton' => 4,
      'South Merton' => 4,
      'South Quay' => 2,
      'South Ruislip' => 5,
      'South Tottenham' => 3,
      'South Wimbledon' => 3,
      'South Woodford' => 4,
      'Southall' => 4,
      'Southbury' => 5,
      'Southfields' => 3,
      'Southgate' => 4,
      'Southwark' => 1,
      'St Helier' => 4,
      'St James Street' => 3,
      'St Johns' => 2,
      'St Margarets' => 4,
      'St Mary Cray' => 6,
      'St Pancras' => 1,
      'St. James_s Park' => 1,
      'St. Johns Wood' => 2,
      'St. Pauls' => 1,
      'Stamford Brook' => 2,
      'Stamford Hill' => 3,
      'Stanmore' => 5,
      'Star Lane' => 3,
      'Stepney Green' => 2,
      'Stockwell' => 2,
      'Stoke Newington' => 2,
      'Stonebridge Park' => 3,
      'Stoneleigh' => 5,
      'Stratford' => 3,
      'Stratford High Street' => 3,
      'Stratford International' => 3,
      'Strawberry Hill' => 5,
      'Streatham' => 3,
      'Streatham Common' => 3,
      'Streatham Hill' => 3,
      'Sudbury and Harrow Road' => 4,
      'Sudbury Hill' => 4,
      'Sudbury Hill Harrow' => 4,
      'Sudbury Town' => 4,
      'Sundridge Park' => 4,
      'Surbiton' => 6,
      'Surrey Quays' => 2,
      'Sutton' => 5,
      'Sutton Common' => 4,
      'Swiss Cottage' => 2,
      'Sydenham' => 3,
      'Sydenham Hill' => 3,
      'Syon Lane' => 4,
      'Tadworth' => 6,
      'Tattenham Corner' => 6,
      'Teddington' => 6,
      'Temple' => 1,
      'Thames Ditton' => 6,
      'Therapia Lane' => 3,
      'Theydon Bois' => 6,
      'Thornton Heath' => 4,
      'Tolworth' => 5,
      'Tooting' => 3,
      'Tooting Bec' => 3,
      'Tooting Broadway' => 3,
      'Tottenham Court Road' => 1,
      'Tottenham Hale' => 3,
      'Totteridge and Whetstone' => 4,
      'Tower Gateway' => 1,
      'Tower Hill' => 1,
      'Tufnell Park' => 2,
      'Tulse Hill' => 3,
      'Turkey Street' => 6,
      'Turnham Green' => 2,
      'Turnpike Lane' => 3,
      'Twickenham' => 5,
      'Upminster' => 6,
      'Upminster Bridge' => 6,
      'Upney' => 4,
      'Upper Holloway' => 2,
      'Upper Warlingham' => 6,
      'Upton Park' => 3,
      'Uxbridge' => 6,
      'Vauxhall' => 1,
      'Victoria' => 1,
      'Waddon' => 5,
      'Waddon Marsh' => 3,
      'Wallington' => 5,
      'Walthamstow Central' => 3,
      'Walthamstow Queens Road' => 3,
      'Wandle Park' => 3,
      'Wandsworth Common' => 3,
      'Wandsworth Road' => 2,
      'Wandsworth Town' => 2,
      'Wanstead' => 4,
      'Wanstead Park' => 3,
      'Wapping' => 2,
      'Warren Street' => 1,
      'Warwick Avenue' => 2,
      'Waterloo' => 1,
      'Waterloo East' => 1,
      'Wellesley Road' => 3,
      'Welling' => 4,
      'Wembley Central' => 4,
      'Wembley Park' => 4,
      'Wembley Stadium' => 4,
      'West Acton' => 3,
      'West Brompton' => 2,
      'West Croydon' => 5,
      'West Drayton' => 6,
      'West Dulwich' => 3,
      'West Ealing' => 3,
      'West Finchley' => 4,
      'West Ham' => 3,
      'West Hampstead' => 2,
      'West Hampstead Thameslink' => 2,
      'West Harrow' => 5,
      'West India Quay' => 2,
      'West Kensington' => 2,
      'West Norwood' => 3,
      'West Ruislip' => 6,
      'West Silvertown' => 3,
      'West Sutton' => 5,
      'West Wickham' => 5,
      'Westbourne Park' => 2,
      'Westcombe Park' => 3,
      'Westferry' => 2,
      'Westminster' => 1,
      'White City' => 2,
      'White Hart Lane' => 3,
      'Whitechapel' => 2,
      'Whitton' => 5,
      'Whyteleafe' => 6,
      'Whyteleafe South' => 6,
      'Willesden Green' => 2,
      'Willesden Junction' => 3,
      'Wimbledon' => 3,
      'Wimbledon Chase' => 3,
      'Wimbledon Park' => 3,
      'Winchmore Hill' => 4,
      'Wood Green' => 3,
      'Wood Lane' => 2,
      'Wood Street' => 4,
      'Woodford' => 4,
      'Woodgrange Park' => 3,
      'Woodmansterne' => 6,
      'Woodside' => 3,
      'Woodside Park' => 4,
      'Woolwich' => 4,
      'Woolwich Arsenal' => 4,
      'Woolwich Dockyard' => 3,
      'Worcester Park' => 4}
    zone = stations[name]
  end

  private :check_zone

end