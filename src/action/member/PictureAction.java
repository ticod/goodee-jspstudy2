package action.member;

import action.Action;
import action.ActionForward;
import com.oreilly.servlet.MultipartRequest;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;

public class PictureAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String path = request.getServletContext().getRealPath("/") + "model2/member/picture/";
        int size = 10 * 1024 * 1024;
        File pathDirectory = new File(path);
        if (!pathDirectory.exists()) {
            pathDirectory.mkdirs();
        }
        MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8");
        String imgName = multi.getFilesystemName("picture");
        BufferedImage bi = ImageIO.read(new File(path + imgName));
        int width = bi.getWidth() / 3;
        int height = bi.getHeight() / 3;
        BufferedImage thumbnail = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = thumbnail.createGraphics();
        g.drawImage(bi, 0, 0, width, height, null);
        File f = new File(path + "sm_" + imgName);
        ImageIO.write(thumbnail, "jpg", f);

        request.setAttribute("imgName", imgName);
        return new ActionForward();
    }
}
