class BaptismPdf < Prawn::Document

    def initialize(baptism)
        super(top_margin: 100)
        header(baptism.baptised.name_for_display)
        content(baptism)
    end

    def header(baptised_name)
        font_families.update('FiraSans' => {
            normal: 'app/assets/fonts/FiraSans-Regular.ttf',
            italic: 'app/assets/fonts/FiraSans-Italic.ttf',
            bold: 'app/assets/fonts/FiraSans-Bold.ttf',
            bold_italic: 'app/assets/fonts/FiraSans-BoldItalic.ttf',
        })
        font_size(36) do
            font 'FiraSans', style: :italic
            text I18n.t('pdfs.baptism.header'), align: :center
        end
    end

    def content(baptism)
        font 'FiraSans', size: 16, style: :italic
        default_leading 7
        move_down 100
        span(400, position: :center) do
            text I18n.t('pdfs.baptism.content',
                    church: baptism.church_name,
                    date: baptism.date.strftime('%d de %B de %Y'),
                    priest: baptism.priest_name_for_display,
                    baptised: baptism.baptised_name_for_display,
                    baptised_commune: baptism.baptised_birth_commune_name,
                    baptised_birth: baptism.baptised_birth_date.strftime('%d de %B de %Y'),
                    baptised_nin: baptism.baptised_nin_for_display,
                    father: baptism.father_name_for_display,
                    mother: baptism.mother_name_for_display,
                    godfather: baptism.godfather_name_for_display,
                    godmother: baptism.godmother_name_for_display)
        end
    end
end
