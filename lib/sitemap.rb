require 'builder'

class Sitemap

  STATIC_URLS = ['/home',
                 '/shop',
                 '/rezepte',
                 '/kontakt',
                 '/link',
                 '/pages/stevia',
                 '/pages/stevia_gesundheit',
                 '/pages/stevia_pflanze',
                 '/pages/stevia_pulver',
                 '/pages/stevia_rezepte',
                 '/pages/was_ist_stevia']

  class << self
    def create!(url)
      @bad_pages = []
      @pages_to_visit = []
      @url = url
      @url_domain = url[/([a-z0-9-]+)\.([a-z.]+)/i]
      
      @pages_to_visit = STATIC_URLS
#     @pages_to_visit += Category.all.collect{ |c| category_path(c) }
#     @pages_to_visit += Article.all.collect{ |a|   home_path
      @pages_to_visit += Home.all.collect{ |h| home_path       }  
      @pages_to_visit += Stevia.all.collect{ |s| stevia_path    }   
      @pages_to_visit += Shop.all.collect{ |p| stevia_kaufen_path        } 
      @pages_to_visit += Rezepte.all.collect{ |r| rezepts_path  } 
      @pages_to_visit += Kontakt.all.collect{ |k| kontakt_path  } 
                
       @pages_to_visit += Stevia.all.collect{ |sp|  stevia_path           }
       @pages_to_visit += Was_ist_stevi.all.collect{ |wis| was_ist_stevia_path   }
       @pages_to_visit += Stevia_pulver.all.collect{ |spu| stevia_pulver_path    }
       @pages_to_visit += Stevia_pflanze.all.collect{ |spf| stevia_pflanze_path   }      
       @pages_to_visit += Stevia_rezept.all.collect{ |sr|  stevia_rezepte_path   }
       @pages_to_visit += Stevia_gesundheit.all.collect{ |sg|  stevia_gesundheit_path}          
        
      generate_sitemap
      update_search_engines
    end

    private
    def generate_sitemap
      xml_str = ""
      xml = Builder::XmlMarkup.new(:target => xml_str, :indent => 2)

      xml.instruct!
      xml.urlset(:xmlns=>'http://www.sitemaps.org/schemas/sitemap/0.9') {
        @pages_to_visit.each do |url|
          unless @url == url
            xml.url {
              xml.loc(@url + url)
              xml.lastmod(Time.now.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00"))
             }
            
          end
        end
      }

      save_file(xml_str)
    end

    def save_file(xml)
      File.open("#{ Rails.root }/public/sitemap.xml", "w+") do |f|
        f.write(xml)
      end
    end

    # Notify popular search engines of the updated sitemap.xml
    def update_search_engines
      sitemap_uri = @url + 'sitemap.xml'
      escaped_sitemap_uri = CGI.escape(sitemap_uri)
      Rails.logger.info "Notifying Google"
      res = Net::HTTP.get_response('www.google.com', '/webmasters/tools/ping?sitemap=' + escaped_sitemap_uri)
      Rails.logger.info res.class
      Rails.logger.info "Notifying Yahoo"
      res = Net::HTTP.get_response('search.yahooapis.com', '/SiteExplorerService/V1/updateNotification?appid=SitemapWriter&url=' + escaped_sitemap_uri)
      Rails.logger.info res.class
      Rails.logger.info "Notifying Bing"
      res = Net::HTTP.get_response('www.bing.com', '/webmaster/ping.aspx?siteMap=' + escaped_sitemap_uri)
      Rails.logger.info res.class
      Rails.logger.info "Notifying Ask"
      res = Net::HTTP.get_response('submissions.ask.com', '/ping?sitemap=' + escaped_sitemap_uri)
      Rails.logger.info res.class
    end
  end
end