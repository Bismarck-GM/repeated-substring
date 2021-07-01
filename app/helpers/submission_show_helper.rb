module SubmissionShowHelper

  def render_submit_new_button
    if (controller_name.eql? "submissions") && (action_name.eql? "show")
      button = '
      <li class="nav-item" style="margin-right: 2rem;">
        <button class="btn btn-danger mr-3" type="button" data-bs-toggle="collapse" data-bs-target="#collapasable" aria-expanded="false" aria-controls="collapasable">
          Submit a new String
        </button>
      </li>'
      button.html_safe
    end
  end

  def solution_squares
    array = []
    result = @current_submission.result
    @current_submission.text.upcase.each_char.with_index do |char, index|
      if index.between?(result.from, result.to)
        data = "
        <div class=\"col col-1 position-relative text-center border border-4 border-danger fs-1 text-white\" style=\"margin: 0 1rem 1rem 0; \">
          #{char}
          <div class=\"position-absolute fs-6 bottom-0 start-0\">#{index}</div>
        </div>".html_safe
        array << data
      else
        data = "
        <div class=\"col col-1 position-relative text-center border border-2 border-secondary fs-1 text-secondary\" style=\"margin: 0 1rem 1rem 0; \">
          #{char}
          <div class=\"position-absolute fs-6 bottom-0 start-0\">#{index}</div>
        </div>".html_safe
        array << data
      end
    end
    array
  end

end