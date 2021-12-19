# frozen_string_literal: true

module OverrideAgent
  def response_redirect(response, method, page, redirects, headers,
                        referer = current_page)

    puts "called Mechanize::HTTP::Agent#response_redirect(): #{redirects}"

    super(response, method, page, redirects, headers,
          referer = current_page)
  end
end

# Mechanize::HTTP::Agent.prepend(OverrideMechanizeAgent)
