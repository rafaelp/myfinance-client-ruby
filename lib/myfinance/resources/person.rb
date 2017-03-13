module Myfinance
  module Resources
    #
    # A wrapper to Myfinance people API
    #
    # [API]
    #   Documentation: https://app.myfinance.com.br/docs/api/people
    #
    class Person < Base
      #
      # List all people
      #
      # [API]
      #   Method: <tt>GET /people</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/people#get_index
      #
      def find_all
        http.get("/people", body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Find people by attributtes
      #
      # [API]
      #   Method: <tt>GET /people</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/people#get_index
      #
      def find_by(params)
        values = params.map { |k,v| "search[#{k}]=#{v}" }.join("&")

        http.get("/people?#{values}", body: {}) do |response|
          respond_with_collection(response)
        end
      end

      #
      # Show a person
      #
      # [API]
      #   Method: <tt>GET /people/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/people#get_show
      #
      def find(id)
        http.get("/people/#{id}", body: {}) do |response|
          respond_with_object response, "person"
        end
      end

      #
      # Creates a person
      #
      # [API]
      #   Method: <tt>POST /people</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/people#post_create
      #
      def create(params)
        http.post("/people", body: { person: params }) do |response|
          respond_with_object response, "person"
        end
      end

      #
      # Updates a person
      #
      # [API]
      #   Method: <tt>PUT /people/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/people#put_update
      #
      def update(id, params)
        http.put("/people/#{id}", body: { person: params }) do |response|
          respond_with_object response, "person"
        end
      end

      #
      # Destroy a person
      #
      # [API]
      #   Method: <tt>DELETE /people/:id</tt>
      #
      #   Documentation: https://app.myfinance.com.br/docs/api/people#delete_destroy
      #
      def destroy(id)
        http.delete("/people/#{id}", body: {}) do |response|
          respond_with_object response, "person"
        end
      end
    end
  end
end
