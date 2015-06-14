#
# Stop anyone trying to edit the 'nestoria' object
#
module NestoriaReadonly

  def block_nestoria(object, path)
    if object.name == 'nestoria'
      respond_to do |format|
        format.html { redirect_to path, notice: 'Sorry, this object is read-only' }
        format.json { head :no_content }
      end
    end
  end

end
